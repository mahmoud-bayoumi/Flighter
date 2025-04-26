import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/home/data/models/to_model.dart';
import 'package:flighter/features/home/data/repos/to_countries_repo/to_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../constants.dart';

class ToRepoImpl implements ToRepo {
  final FlightApiService apiService;
  final String endPoint = 'to';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  ToRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, ToModel>> getToCountries() async {
    try {
      String token = (await _secureStorage.read(key: tokenKey))!;
      var response = await apiService.get(endPoint: endPoint, token: token);
      if (response['success']) {
        return right(ToModel.fromJson(response));
      } else {
        return left(Failure(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
