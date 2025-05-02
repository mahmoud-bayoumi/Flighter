import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/profile/data/repos/delete_account_repo/delete_account_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeleteAccountRepoImpl implements DeleteAccountRepo {
  final ApiService apiService;
  String endPoint = 'delete-account';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  DeleteAccountRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, String>> deleteAccount(
      {required String password}) async {
    String token = (await _storage.read(key: tokenKey))!;
    try {
      var response = await apiService.delete(
          endPoint: endPoint,
          data: {
            "password": password,
          },
          token: token);
      log(response.toString());

      if (response['message'] == 'Password is incorrect.') {
        log(response.toString());
        return left(Failure(response['message']));
      }
      log(response.toString());
      return right('delete done');
    } on DioException catch (e) {
      log(e.response!.data.toString());
      return left(Failure(e.response!.data['message']));
    } catch (e) {
      log(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
