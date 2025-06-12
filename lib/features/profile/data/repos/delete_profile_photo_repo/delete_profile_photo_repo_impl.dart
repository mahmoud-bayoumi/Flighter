import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/api_service.dart';

import 'package:flighter/core/utils/failure.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'delete_profile_photo_repo.dart';

class DeleteProfilePhotoRepoImpl implements DeleteProfilePhotoRepo {
  final ApiService apiService;
  final String endPoint = 'delete-profile-photo';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  DeleteProfilePhotoRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, String>> deleteProfilePhoto() async {
    try {
      final token = await _secureStorage.read(key: tokenKey);
      var response = await apiService.delete(endPoint: endPoint, token: token!);
      if (response['message'] == 'No profile photo to delete.') {
        return left(Failure.formJson(response['message']));
      }
      if (response['message'] == 'User not authenticated.') {
        return left(Failure.formJson(response['message']));
      }
      return right(response['message']);
    } on DioException catch (e) {
      return left(Failure.formJson(e.response!.data['message']));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
