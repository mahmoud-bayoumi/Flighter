import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/home/data/models/search_model/search_model.dart';
import 'package:flighter/features/home/data/repos/search_repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final FlightApiService _flightApiService;

  final String endPoint = 'search';
  SearchRepoImpl({required FlightApiService flightApiService})
      : _flightApiService = flightApiService;

  @override
  Future<Either<Failure, SearchModel>> getOneWaySearchData(
      {required String from,
      required String to,
      required String startDate,
      int noOfTravelers = 1,
      required int classTypeId,
      int flightTypeId = 1}) async {
    try {
      var response = await _flightApiService.post(endPoint: endPoint, data: {
        "from": from,
        "to": to,
        "startDate": startDate,
        "noOfTravelers": noOfTravelers,
        "classTypeId": classTypeId,
        "flightTypeId": flightTypeId
      });
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
      int flightTypeId = 2}) async {
    try {
      var response = await _flightApiService.post(endPoint: endPoint, data: {
        "from": from,
        "to": to,
        "startDate": startDate,
        "endDate": endDate,
        "noOfTravelers": noOfTravelers,
        "classTypeId": classTypeId,
        "flightTypeId": flightTypeId
      });
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
