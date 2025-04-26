import 'message.dart';

class VerifyModel {
  Message? message;

  VerifyModel({this.message});

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        message: json['message'] == null
            ? null
            : Message.fromJson(json['message'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message?.toJson(),
      };
}
