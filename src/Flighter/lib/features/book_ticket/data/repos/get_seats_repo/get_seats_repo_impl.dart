import 'package:dartz/dartz.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/book_ticket/data/models/seats_model/seats_model.dart';
import 'package:flighter/features/book_ticket/data/repos/get_seats_repo/get_seats_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetSeatsRepoImpl implements GetSeatsRepo {
  final FlightApiService flightApiService;
  String endPoint = 'seats-status /';
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  GetSeatsRepoImpl({required this.flightApiService});

  @override
  Future<Either<Failure, SeatsModel>> getSeats({required int ticketId}) async {
    try {
      String token = (await _flutterSecureStorage.read(key: tokenKey))!;
      var response = await flightApiService.get(
          endPoint: endPoint + ticketId.toString(), token: token);

      if (response['success'] && response["message"] == null) {
        return right(SeatsModel.fromJson(response));
      } else {
        return left(Failure.formJson(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
