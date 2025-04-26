import 'message.dart';

class SignInModel {
  Message? message;

  SignInModel({this.message});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: json['message'] == null
            ? null
            : Message.fromJson(json['message'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message?.toJson(),
      };
}
