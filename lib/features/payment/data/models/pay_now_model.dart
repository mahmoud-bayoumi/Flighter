class PayNowModel {
  bool? success;
  dynamic data;
  String? message;

  PayNowModel({this.success, this.data, this.message});

  factory PayNowModel.fromJson(Map<String, dynamic> json) => PayNowModel(
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
