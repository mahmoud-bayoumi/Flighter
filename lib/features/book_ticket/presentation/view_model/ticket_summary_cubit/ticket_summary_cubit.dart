import 'package:flighter/features/book_ticket/data/models/ticket_summary_model/ticket_summary_model/ticket_summary_model.dart';
import 'package:flighter/features/book_ticket/data/repos/ticket_summary_repo/ticket_summary_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ticket_summary_state.dart';

class TicketSummaryCubit extends Cubit<TicketSummaryState> {
  final TicketSummaryRepo ticketSummaryRepo;
  late int ticketId;
  int ticketCounter = 0;
  late int noOfTravelers = 1;
  bool isFromOffer = false;
  String offerClassType = '';
  bool confirmIsClicked = false;
  String? depatureDate;
  List<String> selectedSeats = [];
  late TicketSummaryModel ticketSummaryModel;
  TicketSummaryCubit(this.ticketSummaryRepo) : super(TicketSummaryInitial());

  Future<void> getTicketSummary() async {
    emit(TicketSummaryLoading());
    var response = await ticketSummaryRepo.getTicketSummary(
        ticketId: ticketId, selectedSeats: selectedSeats);

    response.fold((error) {
      emit(TicketSummaryFailure(errMessage: error.errMessage));
    }, (data) {
      ticketSummaryModel = data;
      emit(TicketSummarySuccess());
    });
  }
}
