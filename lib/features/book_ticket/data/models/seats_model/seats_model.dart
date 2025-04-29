import 'data.dart';

class SeatsModel {
  bool? success;
  Data? data;
  dynamic message;

  SeatsModel({this.success, this.data, this.message});

  factory SeatsModel.fromJson(Map<String, dynamic> json) => SeatsModel(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
