import 'offer_ticker_data.dart';

class OfferModel {
  bool? success;
  List<OfferTicketData>? data;
  String? message;

  OfferModel({this.success, this.data, this.message});

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => OfferTicketData.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
