import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/home/data/models/from_model.dart';
import 'package:flighter/features/home/data/repos/from_countries_repo/from_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/flight_api_service.dart';

class FromRepoImpl implements FromRepo {
  final FlightApiService apiService;
  final String endPoint = 'from';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  FromRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, FromModel>> getFromCountries() async {
    try {
      String token = (await _secureStorage.read(key: tokenKey))!;
      var response = await apiService.get(endPoint: endPoint, token: token);
      if (response['success']) {
        return right(FromModel.fromJson(response));
      } else {
        return left(Failure(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
