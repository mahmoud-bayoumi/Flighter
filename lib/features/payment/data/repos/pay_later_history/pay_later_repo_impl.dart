import 'package:dartz/dartz.dart';

import 'package:flighter/core/utils/failure.dart';

import 'package:flighter/features/payment/data/models/pay_later_model.dart';

import '../../../../../core/utils/pay_api_service.dart';
import 'pay_later_repo.dart';

class PayLaterRepoImpl implements PayLaterRepo {
  final PayApiService payApiService;
  final String endPoint = 'paylater-history';

  PayLaterRepoImpl({required this.payApiService});
  @override
  Future<Either<Failure, PayLaterModel>> payBookgingLater(
      {required int bookingId,
      required String paymentIntentId,
      required String amount}) async {
    try {
      var response = await payApiService.post(endPoint: endPoint, data: {
        "bookingId": bookingId,
        "paymentIntentId": paymentIntentId,
        "amount": amount,
      });
      if (response['success']) {
        return right(PayLaterModel.fromJson(response));
      } else {
        if (response["message"] ==
            "This Booking doesn't exist.") {
          return right(PayLaterModel.fromJson(response));
        }
        return left(Failure(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
