import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/book_ticket/data/models/ticket_summary_model/ticket_summary_model/ticket_summary_model.dart';
import 'package:flighter/features/book_ticket/data/repos/ticket_summary_repo/ticket_summary_repo.dart';

class TicketSummaryRepoImpl implements TicketSummaryRepo {
  final FlightApiService flightApiService;
  late int ticketId;
  late List<String> selectedSeats;
  String endPoint = 'ticket-summary';

  TicketSummaryRepoImpl({required this.flightApiService});
  @override
  Future<Either<Failure, TicketSummaryModel>> getTicketSummary(
      {required int ticketId, required List<String> selectedSeats}) async {
    try {
      var response = await flightApiService.post(
          endPoint: endPoint,
          data: {"ticketId": ticketId, "selectedSeats": selectedSeats});

      if (response['success'] && response["message"] == null) {
        return right(TicketSummaryModel.fromJson(response));
      } else {
        return left(Failure.formJson(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
