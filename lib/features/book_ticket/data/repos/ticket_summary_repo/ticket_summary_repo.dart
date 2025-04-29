import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/book_ticket/data/models/ticket_summary_model/ticket_summary_model/ticket_summary_model.dart';

abstract class TicketSummaryRepo {
  Future<Either<Failure, TicketSummaryModel>> getTicketSummary(
      {required int ticketId, required List<String> selectedSeats});
}
