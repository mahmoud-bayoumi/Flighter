
sealed class GetSeatsState {}

final class GetSeatsInitial extends GetSeatsState {}

final class GetSeatsLoading extends GetSeatsState {}

final class GetSeatsSuccess extends GetSeatsState {}

final class GetSeatsFailure extends GetSeatsState {
  final String errMessage;

  GetSeatsFailure({required this.errMessage}); 
}
