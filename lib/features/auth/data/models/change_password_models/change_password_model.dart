import 'errors.dart';

class ChangePasswordModel {
  String? type;
  String? title;
  int? status;
  Errors? errors;
  String? traceId;
  String? error;
  String? message;

  ChangePasswordModel({
    this.type,
    this.title,
    this.status,
    this.errors,
    this.traceId,
    this.error, 
    this.message
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      type: json['type'] as String?,
      title: json['title'] as String?,
      status: json['status'] as int?,
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
      traceId: json['traceId'] as String?,
       error: json['error'] as String?,
        message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'status': status,
        'errors': errors?.toJson(),
        'traceId': traceId,
      };
}
