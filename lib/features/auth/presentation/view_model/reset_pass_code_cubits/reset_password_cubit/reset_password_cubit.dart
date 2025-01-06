import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repos/reset_password_repos/reset_password_repo/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo resetPasswordRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitial());
  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    log('Reset Loading');
    var response = await resetPasswordRepo.resetPassword(
        email: emailController.text,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmNewPasswordController.text);
    return response.fold(
      (failure) {
        log('Reset Failure');
        emit(ResetPasswordFailure(errMessage: failure.errMessage));
      },
      (resetPassModel) {
        log('Reset Success');
        emit(ResetPasswordSuccess());
      },
    );
  }

  void vaildateUserInput() {
    if (formKey.currentState!.validate()) {
      resetPassword();
    }
  }
}
