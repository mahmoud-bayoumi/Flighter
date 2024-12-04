import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/verify_email_model.dart';
import 'package:flighter/features/auth/data/repos/verify_email_repo/verify_email_repo.dart';

class VerifyEmailRepoImpl implements VerifyEmailRepo {
  final ApiService _apiService;
  String endPoint = 'verify-email';
  VerifyEmailRepoImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<Either<Failure, VerifyEmailModel>> verifyEmail(
      {required String email, required String code}) async {
    try {
      var response = await _apiService.post(
        endPoint: endPoint,
        data: {
          "email": email,
          "verificationCode": code,
        },
      );

      if (response['message'] == 'Invalid or expired verification request.') {
        return left(Failure('Invalid or expired verification request.'));
      }
      // success request
      return right(VerifyEmailModel.fromJson(response));
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['message'] ?? 'An unknown error occurred.';
      log('DioException: $errorMessage');
      return left(Failure(errorMessage));
    } catch (e) {
      log('General exception: ${e.toString()}');
      return left(Failure('An unexpected error occurred.'));
    }
  }
}
