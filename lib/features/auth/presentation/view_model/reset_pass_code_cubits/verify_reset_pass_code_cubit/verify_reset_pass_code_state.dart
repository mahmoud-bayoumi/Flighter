part of 'verify_reset_pass_code_cubit.dart';

@immutable
sealed class VerifyResetPassCodeState {}

final class VerifyResetPassCodeInitial extends VerifyResetPassCodeState {}

final class VerifyResetPassCodeLoading extends VerifyResetPassCodeState {}

final class VerifyResetPassCodeSuccess extends VerifyResetPassCodeState {}

final class VerifyResetPassCodeFailure extends VerifyResetPassCodeState {
  final String errMessage;

  VerifyResetPassCodeFailure({required this.errMessage});
}
