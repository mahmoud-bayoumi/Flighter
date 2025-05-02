import 'package:flighter/features/payment/data/models/refund_model/refund_model.dart';
import 'package:flighter/features/payment/data/repos/refund_repo/refund_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'refund_state.dart';

class RefundCubit extends Cubit<RefundState> {
  final RefundRepo refundRepo;
  late RefundModel refundModel;
  late int bookingId;
  RefundCubit(this.refundRepo) : super(RefundInitial());
  Future<void> refundTicket() async {
    emit(RefundLoading());
    var response = await refundRepo.refundTicket(bookingId: bookingId);
    response.fold((error) {
      emit(RefundFailure(errMessage: error.errMessage));
    }, (data) {
      refundModel = data;
      emit(RefundSuccess());
    });
  }
}
