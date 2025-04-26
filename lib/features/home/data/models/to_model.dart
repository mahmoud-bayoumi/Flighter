class ToModel {
  bool? success;
  List<dynamic> data;
  dynamic message;

  ToModel({this.success, required this.data, this.message});

  factory ToModel.fromJson(Map<String, dynamic> json) => ToModel(
        success: json['success'] as bool?,
        data: json['data'] as List<dynamic>,
        message: json['message'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data,
        'message': message,
      };
}
