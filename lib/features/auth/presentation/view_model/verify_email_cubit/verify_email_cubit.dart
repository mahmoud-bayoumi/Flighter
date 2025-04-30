import 'package:dartz/dartz.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/verify_model/verify_model.dart';
import 'package:flighter/features/auth/data/repos/verify_email_repo/verify_email_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/secure_storage.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.verifyRepo) : super(VerifyEmailInitial());
  final VerifyEmailRepoImpl verifyRepo;
  late VerifyModel verifyModel ; 
  final formKey = GlobalKey<FormState>();
  late final String email;
  final TextEditingController code1 = TextEditingController();
  final TextEditingController code2 = TextEditingController();
  final TextEditingController code3 = TextEditingController();
  final TextEditingController code4 = TextEditingController();
  final SecureStorageService secureStorageService =
      const SecureStorageService();
  late Either<Failure, VerifyModel> data;

  Future<void> verifyEmail() async {
    emit(VerifyEmailLoading());
    data = await verifyRepo.verifyEmail(
        email: email,
        code: '${code1.text}${code2.text}${code3.text}${code4.text}');

    data.fold(
      (l) {
        emit(VerifyEmailFailure(errMsg: l.errMessage));
      },
      (r) async {
        verifyModel = r ; 
        await secureStorageService.saveToken(tokenKey, r.message!.token!);
        emit(VerifyEmailSuccess());
      },
    );
  }

  void validateUser() {
    if (formKey.currentState!.validate()) {
      verifyEmail();
    }
  }
}
