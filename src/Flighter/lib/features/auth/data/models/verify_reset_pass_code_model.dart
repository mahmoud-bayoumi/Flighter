class VerifyResetPassCodeModel {
  String? message;
  String? error;
  VerifyResetPassCodeModel({required this.message, required this.error});

  factory VerifyResetPassCodeModel.fromJson(json) {
    return VerifyResetPassCodeModel(
        message: json['message'], error: json['error']);
  }
}
