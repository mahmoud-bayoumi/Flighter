import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/book_ticket/data/models/seats_model/seats_model.dart';

abstract class GetSeatsRepo {
  Future<Either<Failure, SeatsModel>> getSeats({required int ticketId});
}
