import 'package:dartz/dartz.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/secure_storage.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/sign_in_model/sign_in_model.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignInInitial());
  final SignInRepo signInRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SecureStorageService secureStorageService =
      const SecureStorageService();
  bool isLoading = false;
  late SignInModel signInModel;
  Future<void> signInUser() async {
    isLoading = true;

    emit(SignInLoading());
    //log('Email : ${emailController.text}');
    // log('Pass : ${passwordController.text}');
    Either<Failure, SignInModel> response;
    try {
      response = await signInRepo.signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
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
        signInModel = r;
        await secureStorageService.saveToken(
            tokenKey, r.message!.token!); //default
        await secureStorageService.saveToken(
            userIdKey, r.message!.userId!); //default

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
