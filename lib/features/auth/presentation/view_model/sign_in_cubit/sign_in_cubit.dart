import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/sign_in_model.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignInInitial());
  final SignInRepo signInRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  Future<void> signInUser() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    isLoading = true;

    emit(SignInLoading());
    log('Email : ${emailController.text}');
    log('Pass : ${passwordController.text}');
    Either<Failure, SignInModel> response;
    try {
      log('Response : ${signInRepo.signIn(email: emailController.text, password: passwordController.text).toString()}');
      response = await signInRepo.signIn(
          email: emailController.text, password: passwordController.text);
      log(response.toString());
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
        await secureStorage.write(key: 'auth_token', value: r.token ?? '');
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
