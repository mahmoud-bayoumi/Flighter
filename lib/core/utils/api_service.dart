import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "http://hmy.runasp.net/api/Account/";
  ApiService(this._dio);

  Future<Map<String, dynamic>> post(
      {required String endPoint, required data}) async {
    Response response;
    try {
      response = await _dio.post('$baseUrl$endPoint',
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      return response.data;
    } on DioException catch (e) {
      log("Request Error: $e");
      return e.response!.data;
    } catch (e) {
      log("General Error in post : $e");
      return {};
    }
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required String token, required data}) async {
    Response response;
    try {
      response = await _dio.put('$baseUrl$endPoint',
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }));
      return response.data;
    } on DioException catch (e) {
      log("In Put Request Error: $e");
      return e.response!.data;
    } catch (e) {
      log("In Put General Error in post : $e");
      return {};
    }
  }
}
//'Authorization' : 'Bearer $token'
