import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/payment/data/models/refund_model/refund_model.dart';

abstract class RefundRepo {
  Future<Either<Failure, RefundModel>> refundTicket({required int bookingId});
}
