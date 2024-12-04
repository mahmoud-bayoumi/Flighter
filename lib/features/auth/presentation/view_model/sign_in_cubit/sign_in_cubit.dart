import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/secure_storage.dart';
import 'package:flighter/features/auth/data/models/sign_in_model.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignInInitial());
  final SignInRepo signInRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SecureStorageService secureStorageService =
      const SecureStorageService();
  bool isLoading = false;
  Future<void> signInUser() async {
    isLoading = true;

    emit(SignInLoading());
    log('Email : ${emailController.text}');
    log('Pass : ${passwordController.text}');
    Either<Failure, SignInModel> response;
    try {
      response = await signInRepo.signIn(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      throw Exception(e.toString());
    }
    return response.fold(
      (l) {
        isLoading = false;
        emit(SignInFailure(errMessage: l.errMessage));
      },
      (r) async {
        isLoading = false;
        await secureStorageService.saveToken(tokenKey, r.token!); //default
        await secureStorageService.saveToken(
            refreshTokenKey, r.refreshTokenExpiration!);
        emit(SignInSuccess());
      },
    );
  }

  void vaildateUserInput() {
    if (formKey.currentState!.validate()) {
      signInUser();
    }
  }
}
