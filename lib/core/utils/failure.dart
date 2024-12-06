import 'package:dio/dio.dart';

class Failure {
  final String errMessage;
  Failure(this.errMessage);
  factory Failure.formJson(dynamic dioError) {
    if (dioError is String) {
      return Failure(dioError);
    } else if (dioError.type == DioExceptionType.connectionTimeout) {
      return Failure('Connection Timeout');
    } else if (dioError.type == DioExceptionType.sendTimeout) {
      return Failure('Send Timeout');
    } else if (dioError.type == DioExceptionType.receiveTimeout) {
      return Failure('Receive Timeout');
    } else if (dioError.type == DioExceptionType.badResponse) {
      return Failure('Bad Response');
    } else if (dioError.type == DioExceptionType.cancel) {
      return Failure('Request Cancelled');
    } else if (dioError.type == DioExceptionType.unknown) {
      return Failure('No Connection');
    } else {
      return Failure('Oops there was an error. try again later!');
    }
  }
  factory Failure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 422 ||
        statusCode == 401 ||
        statusCode == 403) {
      return Failure(response['message']);
    } else if (statusCode == 404) {
      return Failure(response['error']);
    } else if (statusCode == 500) {
      return Failure('Server Error. Try again later!');
    } else {
      return Failure('Oops there was an error. try again later!');
    }
  }
}
