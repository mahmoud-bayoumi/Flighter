class PayLaterModel {
  bool? success;
  dynamic data;
  String? message;

  PayLaterModel({this.success, this.data, this.message});

  factory PayLaterModel.fromJson(Map<String, dynamic> json) => PayLaterModel(
        success: json['success'] as bool?,
        data: json['data'] as dynamic,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data,
        'message': message,
      };
}
