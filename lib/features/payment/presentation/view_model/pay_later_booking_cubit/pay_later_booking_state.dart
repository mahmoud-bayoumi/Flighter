sealed class PayLaterBookingState {}

final class PayLaterBookingInitial extends PayLaterBookingState {}

final class PayLaterBookingLoading extends PayLaterBookingState {}

final class PayLaterBookingSuccess extends PayLaterBookingState {}

final class PayLaterBookingFailure extends PayLaterBookingState {
  final String errMessage;

  PayLaterBookingFailure({required this.errMessage});
}
