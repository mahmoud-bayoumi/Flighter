import 'datum.dart';

class BookingsModel {
  bool? success;
  List<BookingData>? data;
  String? message;

  BookingsModel({this.success, this.data, this.message});

  factory BookingsModel.fromJson(Map<String, dynamic> json) => BookingsModel(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => BookingData.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
