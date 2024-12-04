import 'package:flighter/features/auth/data/repos/sign_up_repo/sign_up_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepoImpl) : super(SignUpInitial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final SignUpRepoImpl signUpRepoImpl;
  validateUser() {
    if (formKey.currentState!.validate()) {
      signUpUser();
    }
  }

  Future<void> signUpUser() async {
    emit(SignUpLoading());
    var data = await signUpRepoImpl.signUp(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text);

    data.fold(
      (error) {
        emit(SignUpFailure(errMsg: error.errMessage));
      },
      (signUpModel) {
        emit(SignUpSuccess());
      },
    );
  }
}
