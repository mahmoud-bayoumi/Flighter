class SignUpModel {
  String message;

  SignUpModel({required this.message});

  factory SignUpModel.fromJson(json) {
    return SignUpModel(message: json['message']);
  }
}

class SignUpError {
  String title;
  Errors? errors;
  SignUpError({required this.title, this.errors});

  factory SignUpError.fromJson(json) {
    return SignUpError(
        title: json['title'], errors: Errors.fromJosn(json['errors']));
  }
}

class Errors {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  Errors({this.name, this.email, this.password, this.confirmPassword});

  factory Errors.fromJosn(json) {
    return Errors(
        name: json['Name'][0],
        email: json['Email'][0],
        password: json['Password'][0],
        confirmPassword: json['ConfirmPassword'][0]);
  }
}
