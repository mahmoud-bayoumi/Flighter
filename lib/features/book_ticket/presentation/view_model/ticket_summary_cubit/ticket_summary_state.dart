sealed class TicketSummaryState {}

final class TicketSummaryInitial extends TicketSummaryState {}

final class TicketSummaryLoading extends TicketSummaryState {}

final class TicketSummarySuccess extends TicketSummaryState {}

final class TicketSummaryFailure extends TicketSummaryState {
  final String errMessage;

  TicketSummaryFailure({required this.errMessage});
}
