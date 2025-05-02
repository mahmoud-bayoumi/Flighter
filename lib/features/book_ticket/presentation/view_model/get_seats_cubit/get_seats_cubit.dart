import 'dart:developer';

import 'package:flighter/features/book_ticket/data/models/seats_model/seats_model.dart';
import 'package:flighter/features/book_ticket/data/repos/get_seats_repo/get_seats_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_seats_state.dart';

class GetSeatsCubit extends Cubit<GetSeatsState> {
  final GetSeatsRepo getSeatsRepo;
  late int ticketId;
  late SeatsModel seatsModel;
  GetSeatsCubit(this.getSeatsRepo) : super(GetSeatsInitial());
  Future<void> getSeats() async {
    emit(GetSeatsLoading());
    var response = await getSeatsRepo.getSeats(ticketId: ticketId);
    response.fold(
      (l) {
        log(l.errMessage);
        emit(GetSeatsFailure(errMessage: l.errMessage));
      },
      (r) {
        seatsModel = r; 
        log(seatsModel.data.toString());
        emit(GetSeatsSuccess());
      },
    );
  }
}
