import 'package:flighter/features/auth/data/repos/sign_up_repo/sign_up_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  Future<void> signUpUser(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    final SignUpRepoImpl signUpRepoImpl = SignUpRepoImpl();

    emit(SignUpLoading());
    var data = await signUpRepoImpl.signUp(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword);

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
