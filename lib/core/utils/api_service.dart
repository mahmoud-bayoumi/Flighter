import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/secure_storage.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "http://hmy.runasp.net/api/Account/";
  final SecureStorageService _secureStorageService = const SecureStorageService();

  ApiService(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Attach the token to the request before sending
        String? accessToken = await _secureStorageService.getToken('accessToken');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: ( error, handler) async {
        if (error.response?.statusCode == 401) {  // Token expired or invalid
          log("Access token expired. Attempting to refresh token...");
          
          String? refreshToken = await _secureStorageService.getToken('refreshToken');
          if (refreshToken != null) {
            // Call the refresh endpoint
            final refreshResponse = await _refreshToken(refreshToken);
            if (refreshResponse != null && refreshResponse['token'] != null) {
              // Save the new token and retry the original request
              await _secureStorageService.saveToken('accessToken', refreshResponse['token']);
              
              // Create new request options from the original failed request
              var options = error.response!.requestOptions;
              options.headers['Authorization'] = 'Bearer ${refreshResponse['token']}';

              // Use the same method and path, but with the updated token
              final response = await _dio.request(
                options.path,
                data: options.data,
                queryParameters: options.queryParameters,
                options: Options(
                  method: options.method,
                  headers: options.headers,
                  contentType: options.contentType,
                  responseType: options.responseType,
                ),
              );
              
              // Return the new response after retrying the original request
              return handler.resolve(response); // Resolving with the new response
            }
          }
        }
        // If token refresh failed or no retry needed, propagate the error
        return handler.next(error);
      },
    ));
  }

  // Function to refresh the token
  Future<Map<String, dynamic>?> _refreshToken(String refreshToken) async {
    try {
      // Call the refresh token endpoint
      final response = await _dio.get(
        '$baseUrl/refresh-token',  // Adjust endpoint to match your actual refresh endpoint
        queryParameters: {'refreshToken': refreshToken},
      );
      return response.data;  // Assuming the response contains the new token
    } on DioException catch (e) {
      log("Error refreshing token: ${e.response?.data}");
      return null;  // Handle failure
    }
  }

  // POST request method
  Future<Map<String, dynamic>> post({required String endPoint, required data}) async {
    try {
      final response = await _dio.post(
        '$baseUrl$endPoint',
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response.data;
    } on DioError catch (e) {
      log("Request Error: $e");
      return e.response?.data ?? {};
    } catch (e) {
      log("General Error in post: $e");
      return {};
    }
  }

  // PUT request method
  Future<Map<String, dynamic>> put({required String endPoint, required String token, required data}) async {
    try {
      final response = await _dio.put(
        '$baseUrl$endPoint',
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } on DioError catch (e) {
      log("In Put Request Error: $e");
      return e.response?.data ?? {};
    } catch (e) {
      log("In Put General Error in post: $e");
      return {};
    }
  }
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required data,
    required String token,
  }) async {
    Response response;
    try {
      response = await _dio.delete(
        '$baseUrl$endPoint',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      log("DELETE Request Error: $e");
      return e.response?.data ?? {};
    } catch (e) {
      log("General Error in DELETE: $e");
      return {};
    }
  }
}


//'Authorization' : 'Bearer $token'
