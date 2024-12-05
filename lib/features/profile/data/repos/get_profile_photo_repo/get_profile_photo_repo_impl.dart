import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/api_service.dart';

import 'package:flighter/core/utils/failure.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'get_profile_photo_repo.dart';

class GetProfilePhotoRepoImpl implements GetProfilePhotoRepo {
  final ApiService apiService;
  final String endPoint = 'get-profile-photo';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  GetProfilePhotoRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, dynamic>> getUserProfilePhoto() async {
    try {
      final token = await _secureStorage.read(key: tokenKey);
      var response = await apiService.get(endPoint: endPoint, token: token!);
      log('Response in get profile photo : $response');
      return right(response);
    } on DioException catch (e) {
      log('Dio Exception : ${e.response!.data}');
      return left(Failure(e.response!.data));
    } catch (e) {
      log('General Exception : $e');
      return left(Failure(e.toString()));
    }
  }
}
