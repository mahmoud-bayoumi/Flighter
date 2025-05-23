
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';

import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/send_reset_password_model.dart';

import 'send_reset_pass_code_repo.dart';

class SendResetPassCodeRepoImpl implements SendResetPasswordCodeRepo {
  final ApiService apiService;
  String endPoint = 'send-reset-password-code';
  SendResetPassCodeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, SendResetPasswordModel>> sendResetPassCode(
      {required String email}) async {
    try {
      var response =
          await apiService.post(endPoint: endPoint, data: {'email': email});
      return right(SendResetPasswordModel.fromJson(response));
    } on DioException catch (e) {
    
      return left(Failure.formJson(e));
    } catch (e) {
  
      return left(Failure(e.toString()));
    }
  }
}
