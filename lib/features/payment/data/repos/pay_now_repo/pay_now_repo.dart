import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/payment/data/models/pay_now_model.dart';

abstract class PayRepo {
  Future<Either<Failure, PayNowModel>> payNow(
      {required String userId,
      required int ticketId,
      required List<String> seatsId,
      bool isPayNow = true,
     });
}
