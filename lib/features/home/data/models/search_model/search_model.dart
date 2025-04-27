import 'datum.dart';

class SearchModel {
  bool? success;
  List<TicketData>? data;
  dynamic message;

  SearchModel({this.success, this.data, this.message});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => TicketData.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
