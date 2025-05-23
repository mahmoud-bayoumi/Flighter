
import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/home/data/models/airline.dart';
import 'package:flighter/features/home/data/repos/airlines_repo/airlines_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/failure.dart';

class AirlinesRepoImpl implements AirlinesRepo {
  final FlightApiService flightApiService;
  final String endPoint = 'companies';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final List<Airline> airlines = [];
  AirlinesRepoImpl({required this.flightApiService});
  @override
  Future<Either<Failure, List<Airline>>> getAirlines() async {
    try {
      String token = (await _secureStorage.read(key: tokenKey))!;
      var response =
          await flightApiService.getListOfMap(endPoint: endPoint, token: token);
      if (response == []) {
        return left(Failure('Error occures in Airlines'));
      } else {
        for (var airline in response) {
          airlines.add(Airline.fromJson(airline));
        }
          return right(airlines);
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
