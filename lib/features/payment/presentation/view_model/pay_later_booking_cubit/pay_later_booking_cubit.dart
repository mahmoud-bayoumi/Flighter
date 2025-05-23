import 'dart:developer';

import 'package:flighter/features/payment/data/models/pay_later_model.dart';
import 'package:flighter/features/payment/data/repos/pay_later_history/pay_later_repo.dart';
import 'package:flighter/features/payment/presentation/view_model/pay_later_booking_cubit/pay_later_booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayLaterBookingCubit extends Cubit<PayLaterBookingState> {
  final PayLaterRepo payLaterRepo;
  late PayLaterModel payLaterModel;
  late int bookingId;
  late String paymentIntentId, amount;
  PayLaterBookingCubit(this.payLaterRepo) : super(PayLaterBookingInitial());
  Future<void> payLaterBooking() async {
    emit(PayLaterBookingLoading());
    log(bookingId.toString());
    log(paymentIntentId.toString());
    log(amount.toString());

    var response = await payLaterRepo.payBookgingLater(
        bookingId: bookingId, paymentIntentId: paymentIntentId, amount: amount);
    response.fold((error) {
      emit(PayLaterBookingFailure(errMessage: error.errMessage));
    }, (r) {
      log('pay DOBNDDDDDDDDDDDDDDDDDDDDDDDD');
      payLaterModel = r;
      emit(PayLaterBookingSuccess());
    });
  }
}
