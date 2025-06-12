import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/profile/data/models/update_profile_model/profile_model.dart';
import 'package:flighter/features/profile/data/repos/update_profile_repo/update_profile_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final ApiService _apiService;

  UpdateProfileRepoImpl({required ApiService apiService})
      : _apiService = apiService;

  String endPoint = 'update-profile';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  File? imageFile;

  @override
  Future<Either<Failure, ProfileModel>> updateProfile({
    File? profilePhoto, // Pass the photo here
    required String name,
    String? dateOfBirth,
    String? country,
  }) async {
    // Initialize the form data
    final Map<String, dynamic> data = {
      'Name': name,
      if (dateOfBirth != null)
        'DateOfBirth': dateOfBirth, // Include if not null
      if (country != null) 'Country': country, // Include if not null
    };

    // Add the profile photo if it exists
    if (profilePhoto != null) {
      data['profilePhoto'] = await MultipartFile.fromFile(
        profilePhoto.path,
        filename: 'profile.jpg',
      );
    }

    // Create the FormData object
    FormData formData = FormData.fromMap(data);

    // Get the token
    String? token = await _storage.read(key: tokenKey);
    if (token == null) {
      return left(Failure('Authentication token is missing.'));
    }

    try {
      // Send the API request
      var response = await _apiService.putProfile(
        endPoint: endPoint, // Corrected from 'endPoint' string
        token: token,
        data: formData,
      );

      // Check for errors in the response
      if (response['errors'] != null) {
        final errorMessages = response['errors']
            .values
            .where((value) => value != null)
            .map((value) => value[0])
            .join(', ');
        return left(Failure(errorMessages));
      }

      if (response['message'] != null) {
        return right(ProfileModel.fromJosn(response));
      }

      return right(ProfileModel.fromJosn(response));
    } on DioException catch (e) {
      return left(
          Failure.formJson(e.response?.data['message'] ?? 'Unknown error'));
    } catch (e) {
      return left(Failure('General Exception: ${e.toString()}'));
    }
  }
}
