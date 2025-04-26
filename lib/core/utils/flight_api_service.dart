import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "http://hmy.runasp.net/Flight/";
  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, required String token}) async {
    try {
      final response = await _dio.get(
        '$baseUrl$endPoint',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } on DioException catch (e) {
      log("Request Error: $e");
      return e.response?.data ?? {};
    } catch (e) {
      log("General Error in post: $e");
      return {};
    }
  }


  // POST request method
  Future<Map<String, dynamic>> post(
      {required String endPoint, required data}) async {
    try {
      final response = await _dio.post(
        '$baseUrl$endPoint',
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response.data;
    } on DioException catch (e) {
      log("Request Error: $e");
      return e.response?.data ?? {};
    } catch (e) {
      log("General Error in post: $e");
      return {};
    }
  }

  // PUT request method
  Future<Map<String, dynamic>> put(
      {required String endPoint, required String token, required data}) async {
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
    } on DioException catch (e) {
      log("In Put Request Error: $e");
      return e.response?.data ?? {};
    } catch (e) {
      log("In Put General Error in post: $e");
      return {};
    }
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    data,
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
