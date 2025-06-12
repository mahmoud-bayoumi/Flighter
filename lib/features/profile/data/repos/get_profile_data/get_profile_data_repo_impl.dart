import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/profile/data/models/get_profile_data_model.dart';
import 'package:flighter/features/profile/data/repos/get_profile_data/get_profile_data_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetProfileDataRepoImpl implements GetProfileDataRepo {
  final ApiService _apiService;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String endPoint = 'get-user-profile';
  GetProfileDataRepoImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<Either<Failure, ProfileDataModel>> getProfileData() async {
    try {
      final token = await _storage.read(key: tokenKey);

      var response = await _apiService.get(endPoint: endPoint, token: token!);

      return right(ProfileDataModel.fromJson(response));
    } on DioException catch (e) {
      return left(Failure(e.response!.data));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
