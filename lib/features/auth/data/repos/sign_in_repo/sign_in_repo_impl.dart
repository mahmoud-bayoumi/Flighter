import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/sign_in_model.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final ApiService apiService;

  SignInRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, SignInModel>> signIn(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
          endPoint: 'login', data: {'email': email, 'password': password});
      return right(SignInModel.fromJson(data));
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      return left(Failure(e.message ?? 'Unknown error'));
    } catch (e) {
      log('General exception: $e');
      return left(Failure(e.toString()));
    }
  }
}
