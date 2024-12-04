import 'package:flighter/features/profile/data/repos/change_password_repo/change_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepo changePasswordRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();

  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());
  Future<void> changePassword() async {
    emit(ChangePasswordLoading());
    var response = await changePasswordRepo.changePassword(
        oldPassword: oldPassword.text,
        newPassword: newPassword.text,
        confirmNewPassword: confirmNewPassword.text);
    response.fold((failure) {
      emit(ChangePasswordFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(ChangePasswordSuccess());
    });
  }

  void vaildateUserInput() {
    if (formKey.currentState!.validate()) {
      changePassword();
    }
  }
}
