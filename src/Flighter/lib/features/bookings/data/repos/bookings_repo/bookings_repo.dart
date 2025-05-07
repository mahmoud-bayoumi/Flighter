import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/bookings/data/models/bookings_model/bookings_model.dart';

abstract class BookingsRepo {
  Future<Either<Failure, BookingsModel>> getBookingsTickets(
      {required String userId});
}
