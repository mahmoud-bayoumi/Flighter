sealed class RefundState {}

final class RefundInitial extends RefundState {}

final class RefundLoading extends RefundState {}

final class RefundSuccess extends RefundState {}

final class RefundFailure extends RefundState {
  final String errMessage;

  RefundFailure({required this.errMessage});
}
