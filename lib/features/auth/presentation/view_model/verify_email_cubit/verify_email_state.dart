part of 'verify_email_cubit.dart';


sealed class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}

final class VerifyEmailLoading extends VerifyEmailState {}

final class VerifyEmailSuccess extends VerifyEmailState {}

final class VerifyEmailFailure extends VerifyEmailState {
  final String errMsg;

  VerifyEmailFailure({required this.errMsg});
}
