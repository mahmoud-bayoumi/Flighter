import 'dart:convert';
import 'dart:typed_data';
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
  Future<Either<Failure, Uint8List>> getUserProfilePhoto() async {
    try {
      final token = await _secureStorage.read(key: tokenKey);
      var response = await apiService.getRequestForImage(
          endPoint: endPoint, token: token ?? '');

      // If the response is a List<int> (could be image or error message), attempt to decode
      if (response is List<int>) {
        String decodedResponse = String.fromCharCodes(response);

        try {
          // Try to decode the response as JSON
          final jsonResponse = jsonDecode(decodedResponse);

          // Check for specific error messages
          if (jsonResponse['message'] == 'No profile photo available.') {
            return left(Failure(jsonResponse['message']));
          }
          if (jsonResponse['message'] == 'User not authenticated.') {
            return left(Failure(jsonResponse['message']));
          }
        } catch (e) {
          // If JSON decoding fails, treat the response as image data
          return right(Uint8List.fromList(response));
        }
      }
      if (response is Uint8List) {
        return right(response);
      }
      // If none of the above conditions match, return a generic error
      return left(Failure('Unexpected response format'));
    } on DioException catch (e) {
      return left(Failure(e.response!.data));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
