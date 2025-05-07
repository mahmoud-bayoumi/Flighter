import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/home/data/models/search_model/search_model.dart';
import 'package:flighter/features/home/data/repos/search_repo/search_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../constants.dart';

class SearchRepoImpl implements SearchRepo {
  final FlightApiService _flightApiService;
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();
  String endPoint = 'search?';

  SearchRepoImpl({required FlightApiService flightApiService})
      : _flightApiService = flightApiService;

  @override
  Future<Either<Failure, SearchModel>> getOneWaySearchData(
      {required String from,
      required String to,
      required String startDate,
      int noOfTravelers = 1,
      required int classTypeId,
      int flightTypeId = 1,
      bool cheapestFilter = false,
      bool fastestFilter = false,
      List<int> airlines = const []}) async {
    final token = await _flutterSecureStorage.read(key: tokenKey);
    try {
      String query =
          'FlightTypeId=$flightTypeId&From=$from&To=$to&StartDate=$startDate&NoOfTravelers=$noOfTravelers&ClassTypeId=$classTypeId&FilterCheapest=$cheapestFilter&FilterFastest=$fastestFilter';
      log(airlines.toString());
      if (airlines.isNotEmpty) {
        String airLinesQuery = '';
        for (int i = 0; i < airlines.length; i++) {
          airLinesQuery += '&AirlineIds=${airlines[i]}';
        }
        query += airLinesQuery;
      }
      var response = await _flightApiService.get(
          endPoint: endPoint + query, token: token!);
      if (response['success']) {
        return right(SearchModel.fromJson(response));
      } else {
        return left(Failure(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SearchModel>> getRoundSearchData(
      {required String from,
      required String to,
      required String startDate,
      required String endDate,
      int noOfTravelers = 1,
      required int classTypeId,
      int flightTypeId = 2,
      bool cheapestFilter = false,
      bool fastestFilter = false,
      List<int> airlines = const []}) async {
    try {
      final token = await _flutterSecureStorage.read(key: tokenKey);

      String qurey =
          'FlightTypeId=$flightTypeId&From=$from&To=$to&StartDate=$startDate&EndDate=$endDate&NoOfTravelers=$noOfTravelers&ClassTypeId=$classTypeId&FilterCheapest=$cheapestFilter&FilterFastest=$fastestFilter';
      if (airlines.isNotEmpty) {
        String airLinesQuery = '';
        for (int i = 0; i < airlines.length; i++) {
          airLinesQuery += '&AirlineIds=${airlines[i]}';
        }
        qurey += airLinesQuery;
      }
      var response = await _flightApiService.get(
          endPoint: endPoint + qurey, token: token!);

      log(response.toString());
      if (response['success']) {
        return right(SearchModel.fromJson(response));
      } else {
        return left(Failure(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
