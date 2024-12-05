import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repos/reset_password_repos/verify_reset_pass_code_repo/verify_reset_pass_code_repo.dart';

part 'verify_reset_pass_code_state.dart';

class VerifyResetPassCodeCubit extends Cubit<VerifyResetPassCodeState> {
  final VerifyResetPassCodeRepo verifyResetPassCodeRepo;
  late final String email;
  final formKey = GlobalKey<FormState>();
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  VerifyResetPassCodeCubit(this.verifyResetPassCodeRepo)
      : super(VerifyResetPassCodeInitial());

  Future<void> verifyResetPassCode() async {
    emit(VerifyResetPassCodeLoading());
    log('Verify loading');
    var response = await verifyResetPassCodeRepo.verifyResetPassCode(
        email: email,
        code: '${code1.text}${code2.text}${code3.text}${code4.text}');

    response.fold(
      (failure) {
        log('Verify failure');
        emit(VerifyResetPassCodeFailure(errMessage: failure.errMessage));
      },
      (verifyModel) {
        log('Verify success');
        emit(VerifyResetPassCodeSuccess());
      },
    );
  }

  void vaildateUserInput() {
    if (formKey.currentState!.validate()) {
      verifyResetPassCode();
    }
  }
}
