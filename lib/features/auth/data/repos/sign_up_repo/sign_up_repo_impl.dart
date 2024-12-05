import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/sign_up_model.dart';
import 'package:flighter/features/auth/data/repos/sign_up_repo/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final ApiService apiService;

  SignUpRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, SignUpModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var response = await apiService.post(endPoint: 'register', data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      });

      if (response['message'] == "Invalid or expired verification request.") {
        log('DioException: ${response['message']}');
        return left(Failure(response['message']));
      }
      // Handle generic message error
      if (response['message'] == "Email is already registered!") {
        log('DioException: ${response['message']}');
        return left(Failure(response['message']));
      }
      if (response['message'] ==
          "Password is not strong enough: Passwords must be at least 6 characters.") {
        log('DioException: ${response['message']}');
        return left(Failure(response['message']));
      }
     
      // Check for specific error messages
      if (response['errors'] != null) {
        // Handle invalid email error
        if (response['errors']['Email']?[0] == "Invalid Email") {
          log('DioException: ${response['errors']['Email'][0]}');
          return left(Failure(response['errors']['Email'][0]));
        }
        // Handle confirm password mismatch error
        if (response['errors']['ConfirmPassword']?[0] ==
            "Passwords do not match. Please try again") {
          log('DioException: ${response['errors']['ConfirmPassword'][0]}');
          return left(Failure(response['errors']['ConfirmPassword'][0]));
        }
      }

      // Success case
      return right(SignUpModel.fromJson(response));
    } on DioException catch (e) {
      // Safely handle Dio exceptions
      final errorData = e.response?.data;
      final errorMessage =
          errorData?['errors']?['Email']?[0] ?? 'An unknown error occurred.';
      log('DioException: $errorMessage');
      return left(Failure(errorMessage));
    } catch (e) {
      log('General exception: ${e.toString()}');
      return left(Failure('An unexpected error occurred.'));
    }
  }
}
