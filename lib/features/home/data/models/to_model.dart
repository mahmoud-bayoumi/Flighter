class ToModel {
	bool? success;
	List<String>? data;
	dynamic message;

	ToModel({this.success, this.data, this.message});

	factory ToModel.fromJson(Map<String, dynamic> json) => ToModel(
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
