import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/verify_reset_pass_code_model.dart';
import 'verify_reset_pass_code_repo.dart';

class VerifyResetPassCodeRepoImpl implements VerifyResetPassCodeRepo {
  final ApiService apiService;
  final String endPoint = 'verify-resetPass-code';

  VerifyResetPassCodeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, VerifyResetPassCodeModel>> verifyResetPassCode(
      {required String email, required String code}) async {
    try {
      var response = await apiService
          .post(endPoint: endPoint, data: {'email': email, 'code': code});
      if (response['error'] == 'Invalid or expired reset password code.') {
        return left(Failure.formJson(response['error']));
      }

      return right(VerifyResetPassCodeModel.fromJson(response));
    } on DioException catch (e) {
      log('Dio Excep : ${e.response!.data}');
      return left(Failure.formJson(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
