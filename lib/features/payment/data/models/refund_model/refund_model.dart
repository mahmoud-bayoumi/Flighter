import 'data.dart';

class RefundModel {
  bool? success;
  Data? data;
  String? message;

  RefundModel({this.success, this.data, this.message});

  factory RefundModel.fromJson(Map<String, dynamic> json) => RefundModel(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
