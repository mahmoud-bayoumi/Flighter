class ChangePasswordModel {
  final String message;
  final ChangePasswordErrors? errors;
  ChangePasswordModel({required this.message, this.errors});
  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
        errors: ChangePasswordErrors.fromJson(json), message: json['message']);
  }
}

class ChangePasswordErrors {
  final String? type;
  final String? title;
  final int? status;
  final Map<String, List<String>>? errors;
  final String? traceId;

  ChangePasswordErrors({
    this.type,
    this.title,
    this.status,
    this.errors,
    this.traceId,
  });

  // Factory constructor to create a ChangePasswordError from a JSON map
  factory ChangePasswordErrors.fromJson(Map<String, dynamic> json) {
    return ChangePasswordErrors(
      type: json['type'],
      title: json['title'],
      status: json['status'],
      errors: json['errors'] != null
          ? Map<String, List<String>>.from(json['errors'])
          : null,
      traceId: json['traceId'],
    );
  }
}
