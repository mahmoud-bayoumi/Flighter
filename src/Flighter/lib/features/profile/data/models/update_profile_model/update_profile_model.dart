import 'errors.dart';

class UpdateProfileModel {
  String? type;
  String? title;
  int? status;
  Errors? errors;
  String? traceId;

  UpdateProfileModel({
    this.type,
    this.title,
    this.status,
    this.errors,
    this.traceId,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      type: json['type'] as String?,
      title: json['title'] as String?,
      status: json['status'] as int?,
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
      traceId: json['traceId'] as String?,
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
