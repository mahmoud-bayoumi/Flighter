import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "http://hmy.runasp.net/api/Account/";
  ApiService(this._dio);

  Future<Map<String, dynamic>> post(
      {required String endPoint, required data}) async {
    try {
      var response = await _dio.post('$baseUrl$endPoint',
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      try {
        log("Login Success: $response");
      } catch (e) {
        log("Error Message: ${response.data}");
      }
      return response.data;
    } catch (e) {
      log("Request Error: $e");
    }
    return {};
  }
}
