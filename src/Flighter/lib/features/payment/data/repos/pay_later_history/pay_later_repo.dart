import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

import '../../models/pay_later_model.dart';

abstract class PayLaterRepo {
  Future<Either<Failure, PayLaterModel>> payBookgingLater(
      {required int bookingId,
      required String paymentIntentId,
      required String amount});
}
