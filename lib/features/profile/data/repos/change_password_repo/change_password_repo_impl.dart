import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/api_service.dart';

import 'package:flighter/core/utils/failure.dart';

import 'package:flighter/features/profile/data/models/change_password_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'change_password_repo.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ApiService apiService;
  final String endPoint = 'change-password';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  ChangePasswordRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ChangePasswordModel>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmNewPassword}) async {
    String token = (await _secureStorage.read(key: tokenKey))!;
    try {
      var response =
          await apiService.put(endPoint: endPoint, token: token, data: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmNewPassword
      });
      if (response['errors'] != null &&
          response['errors']['ConfirmPassword'] != null) {
        return left(Failure.formJson(response['errors']['ConfirmPassword'][0]));
      }

      if (response['message'] == 'Old password is incorrect.') {
        return left(Failure.formJson(response['message']));
      }
      if (response['message'] == 'User not authenticated') {
        return left(Failure.formJson(response['message']));
      }
      if (response['message'] ==
          'New password is not strong enough: Passwords must be at least 6 characters.') {
        return left(Failure.formJson(response['message']));
      }

      if (response['message'] ==
          'New password is not strong enough: Passwords must be at least 6 characters., Passwords must have at least one non alphanumeric character., Passwords must have at least one digit (\'0\'-\'9\')., Passwords must have at least one uppercase (\'A\'-\'Z\').') {
        return left(Failure.formJson(response['message']));
      }

      log('RESPONSE ${response.toString()} ');
      return right(ChangePasswordModel.fromJson(response));
    } on DioException catch (e) {
      log('In Dio Exception : ${e.response!.data['message']}');
      return left(Failure.formJson(e.response?.data['message'] ?? e.message));
      //     return left(Failure.formJson(e));
    } catch (e) {
      log('General Exception : $e');
      return left(Failure(e.toString()));
    }
  }
}
