class FromModel {
  bool? success;
  List<dynamic> data;
  dynamic message;

  FromModel({this.success, required this.data, this.message});

  factory FromModel.fromJson(Map<String, dynamic> json) => FromModel(
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
