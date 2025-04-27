import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/home/data/models/search_model/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> getOneWaySearchData({
    required String from,
    required String to,
    required String startDate,
    required int classTypeId,
    int noOfTravelers = 1,
    int flightTypeId = 1,
  });
  Future<Either<Failure, SearchModel>> getRoundSearchData({
    required String from,
    required String to,
    required String startDate,
    required String endDate,
    int noOfTravelers = 1,
    required int classTypeId,
    int flightTypeId = 2,
  });
}
