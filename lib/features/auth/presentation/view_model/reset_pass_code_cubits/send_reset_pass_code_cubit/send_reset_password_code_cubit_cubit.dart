import 'package:flighter/features/auth/data/repos/reset_password_repos/send_reset_pass_code_repo/send_reset_pass_code_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/send_reset_password_model.dart';

part 'send_reset_password_code_cubit_state.dart';

class SendResetPasswordCodeCubit
    extends Cubit<SendResetPasswordCodeCubitState> {
  final SendResetPasswordCodeRepo sendResetPasswordCodeRepo;
  late SendResetPasswordModel sendResetPasswordModel;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  SendResetPasswordCodeCubit(this.sendResetPasswordCodeRepo)
      : super(SendResetPasswordCodeCubitInitial());
  Future<void> sendPasswordCode() async {
    isLoading = true;
    emit(SendResetPasswordCodeCubitLoading());

    var response = await sendResetPasswordCodeRepo.sendResetPassCode(
        email: emailController.text.trim());
    response.fold(
      (failure) {
        isLoading = false;

        emit(SendResetPasswordCodeCubitFailure(errMessage: failure.errMessage));
      },
      (sendResetCodeModel) {
        isLoading = false;
        sendResetPasswordModel = sendResetCodeModel;
        if (sendResetCodeModel.message == 'Email not found.') {
          emit(SendResetPasswordCodeCubitFailure(
              errMessage: sendResetCodeModel.message!));
        } else {
          emit(SendResetPasswordCodeCubitSent());
        }
      },
    );
  }

  void vaildateUserInput() {
    if (formKey.currentState!.validate()) {
      sendPasswordCode();
    }
  }
}
