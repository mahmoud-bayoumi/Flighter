import 'data.dart';

class TicketSummaryModel {
  bool? success;
  Data? data;
  dynamic message;

  TicketSummaryModel({this.success, this.data, this.message});

  factory TicketSummaryModel.fromJson(Map<String, dynamic> json) {
    return TicketSummaryModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
