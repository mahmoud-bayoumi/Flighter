import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';

import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/reset_password_repo/reset_password_repo.dart';

import 'package:flighter/features/profile/data/models/change_password_model.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ApiService apiService;
  final String endPoint = 'reset-password';
  ResetPasswordRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, ChangePasswordModel>> resetPassword(
      {required String email,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      var response = await apiService.post(endPoint: endPoint, data: {
        "email": email,
        "newPassword": newPassword,
        "confirmPassword": confirmNewPassword
      });
      if (response['errors'] != null &&
          response['errors']['ConfirmPassword'] != null) {
        return left(Failure.formJson(response['errors']['ConfirmPassword'][0]));
      }
      if (response['error'] ==
          'Session expired. Please verify your email and code again.') {
        return left(Failure.formJson(response['error']));
      }

      return right(ChangePasswordModel.fromJson(response));
    } on DioException catch (e) {
      log('Dio Excep : ${e.response!.data}');
      return left(Failure.formJson(e));
    } catch (e) {
      log('General Excep : $e');
      return left(Failure(e.toString()));
    }
  }
}
