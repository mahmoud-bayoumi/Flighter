import 'package:dartz/dartz.dart';

import 'package:flighter/core/utils/failure.dart';

import 'package:flighter/features/payment/data/models/refund_model/refund_model.dart';

import '../../../../../core/utils/pay_api_service.dart';
import 'refund_repo.dart';

class RefundRepoImpl implements RefundRepo {
  final PayApiService payApiService;
  final String endPoint = 'Refund/';

  RefundRepoImpl({required this.payApiService});

  @override
  Future<Either<Failure, RefundModel>> refundTicket(
      {required int bookingId}) async {
    try {
      var response = await payApiService
          .post(endPoint: endPoint + bookingId.toString(), data: {
        "bookingid ": bookingId,
      });
      if (response['success']) {
        return right(RefundModel.fromJson(response));
      } else if (response["message"] ==
          "Refund not allowed. Booking was made more than 2 days ago.") {
        return right(RefundModel.fromJson(response));
      } else {
        return left(Failure(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
