import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/profile/data/repos/get_profile_data/get_profile_data_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetProfileDataRepoImpl implements GetProfileDataRepo {
  final ApiService _apiService;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  GetProfileDataRepoImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<Either<Failure, dynamic>> getProfileData() async {
    String token = (await _storage.read(key: tokenKey))!;

    try {
      var response =
          _apiService.get(endPoint: 'get-user-profile', token: token);
      log('response is ${response.toString()}');
      return right(response.toString());
    } on DioException catch (e) {
      log('Dio Exception response is ${e.response!.data.toString()}');
      return left(Failure(e.response!.data['message']));
    } catch (e) {
      log('General Exception response is ${e.toString()}');
      return left(Failure(e.toString()));
    }
  }
}
