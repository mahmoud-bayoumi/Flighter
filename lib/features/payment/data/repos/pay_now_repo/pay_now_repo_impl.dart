
import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/payment/data/models/pay_now_model.dart';
import 'package:flighter/features/payment/data/repos/pay_now_repo/pay_now_repo.dart';

import '../../../../../core/utils/pay_api_service.dart';

class PayNowRepoImpl implements PayRepo {
  final PayApiService payApiService;
  final String endPoint = 'paylater/paynow';

  PayNowRepoImpl({required this.payApiService});
  @override
  Future<Either<Failure, PayNowModel>> payNow(
      {required String userId,
      required int ticketId,
      required List<String> seatsId,
      bool isPayNow = true,
   
   }) async {
    try {
      var response = await payApiService.post(endPoint: endPoint, data: {
        "userId": userId,
        "ticketId": ticketId,
        "seatsId": seatsId,
        "payNow": isPayNow,
      
      });
      if (response['success']) {
    return right(PayNowModel.fromJson(response));
      } else {
        if (response["message"] ==
            "One or more selected seats are already booked") {
              return right(PayNowModel.fromJson(response));
        }
      }

      return left(Failure(response['message']));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
