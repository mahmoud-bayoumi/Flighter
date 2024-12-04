class SendResetPasswordModel {
  String? message;
  SendResetPasswordModel({required this.message});

  factory SendResetPasswordModel.fromJson(json) {
    return SendResetPasswordModel(message: json['message']);
  }
}
