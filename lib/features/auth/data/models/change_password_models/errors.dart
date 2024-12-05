class Errors {
  List<String>? confirmPassword;

  Errors({this.confirmPassword});

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        confirmPassword: json['ConfirmPassword'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'ConfirmPassword': confirmPassword,
      };
}
