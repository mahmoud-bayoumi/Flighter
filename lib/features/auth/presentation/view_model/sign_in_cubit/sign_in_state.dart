abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInFailure extends SignInState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

class SignInSuccess extends SignInState {}

class SignInLoading extends SignInState {}
