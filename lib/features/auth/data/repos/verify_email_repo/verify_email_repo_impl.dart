
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/verify_model/verify_model.dart';
import 'package:flighter/features/auth/data/repos/verify_email_repo/verify_email_repo.dart';

class VerifyEmailRepoImpl implements VerifyEmailRepo {
  final ApiService _apiService;
  String endPoint = 'verify-email';
  VerifyEmailRepoImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<Either<Failure, VerifyModel>> verifyEmail(
      {required String email, required String code}) async {
    try {
      var response = await _apiService.post(
        endPoint: endPoint,
        data: {
          "email": email,
          "verificationCode": code,
        },
      );
 
      if (response['message'] == 'Incorrect verification code.') {
        return left(Failure('Incorrect verification code.'));
      }

      if (response['message'] == 'Incorrect verification code.') {
        return left(Failure('Incorrect verification code.'));
      }
      if (response['message'] is Map) {
        return right(VerifyModel.fromJson(response));
      } else {
        return left(Failure('Incorrect verification code.'));
      }
      // success request
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        return left(Failure('Server Error'));
      }
      final errorMessage =
          e.response?.data['message'] ?? 'An unknown error occurred.';
   
      return left(Failure(errorMessage));
    } catch (e) {
    
      return left(Failure('An unexpected error occurred.Try again later!'));
    }
  }
}
