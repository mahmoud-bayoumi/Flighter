sealed class GetBookingsState {}

final class GetBookingsInitial extends GetBookingsState {}

final class GetBookingsLoading extends GetBookingsState {}

final class GetBookingsSuccess extends GetBookingsState {}

final class GetBookingsFailure extends GetBookingsState {
  final String errMessage;

  GetBookingsFailure({required this.errMessage});
}
