import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/bookings/data/models/bookings_model/bookings_model.dart';
import 'package:flighter/features/bookings/data/repos/bookings_repo/bookings_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../constants.dart';

class BookingsRepoImpl implements BookingsRepo {
  final FlightApiService flightApiService;
  String endPoint = 'user-bookings/';
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  BookingsRepoImpl({required this.flightApiService});
  @override
  Future<Either<Failure, BookingsModel>> getBookingsTickets(
      {required String userId}) async {
    try {
      String token = (await _flutterSecureStorage.read(key: tokenKey))!;
      var response =
          await flightApiService.get(endPoint: endPoint + userId, token: token);

      if (response['success']) {
        return right(BookingsModel.fromJson(response));
      } else {
        return left(Failure.formJson(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
