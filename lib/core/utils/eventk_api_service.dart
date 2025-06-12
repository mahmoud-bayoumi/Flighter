import 'package:dio/dio.dart';

class EventkApiService {
  final Dio _dio;
  final String baseUrl = "http://eventk.runasp.net/api/Events/";
  EventkApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, String? token}) async {
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
      return e.response?.data ?? {};
    } catch (e) {
      return {};
    }
  }

  Future<List<dynamic>> getListOfMap(
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
      return e.response?.data ?? [];
    } catch (e) {
      return [];
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
      return e.response?.data ?? {};
    } catch (e) {
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
      return e.response?.data ?? {};
    } catch (e) {
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
      return e.response?.data ?? {};
    } catch (e) {
      return {};
    }
  }
}

//'Authorization' : 'Bearer $token'
