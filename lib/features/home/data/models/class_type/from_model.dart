class FromModel {
  bool? success;
  List<String>? data;
  dynamic message;

  FromModel({this.success, this.data, this.message});

  factory FromModel.fromJson(Map<String, dynamic> json) => FromModel(
        success: json['success'] as bool?,
        data: json['data'] as List<String>?,
        message: json['message'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data,
        'message': message,
      };
}
