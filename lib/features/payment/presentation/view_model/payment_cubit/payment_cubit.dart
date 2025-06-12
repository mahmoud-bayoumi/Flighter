import 'package:flighter/features/payment/data/models/pay_now_model.dart';
import 'package:flighter/features/payment/data/repos/pay_now_repo/pay_now_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  late PayNowModel payNowModel;
  final PayRepo payRepo;
  late String userId;
  late int ticketId;
  List<String> seatsId = [];
  bool isPayNow = false;
  String netAmount = '', paymentIntentId = '0';
  int noOfTravelers = 1;
  int amountToPay = 0;
  bool clickedForPay = false;
  PaymentCubit(this.payRepo) : super(PaymentInitial());

  Future<void> pay() async {
    emit(PaymentLoading());

    var response = await payRepo.payNow(
      userId: userId,
      ticketId: ticketId,
      seatsId: seatsId,
      isPayNow: isPayNow,
    );

    response.fold(
      (l) {
        emit(PaymentFailure(errMessage: l.errMessage));
      },
      (r) {
        payNowModel = r;

        seatsId = [];
        emit(PaymentSuccess());
      },
    );
  }
}
