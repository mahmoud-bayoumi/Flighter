part of 'send_reset_password_code_cubit_cubit.dart';

sealed class SendResetPasswordCodeCubitState {}

final class SendResetPasswordCodeCubitInitial
    extends SendResetPasswordCodeCubitState {}

final class SendResetPasswordCodeCubitSent
    extends SendResetPasswordCodeCubitState {}

final class SendResetPasswordCodeCubitFailure
    extends SendResetPasswordCodeCubitState {
  final String errMessage;

  SendResetPasswordCodeCubitFailure({required this.errMessage});
}

final class SendResetPasswordCodeCubitLoading
    extends SendResetPasswordCodeCubitState {}
