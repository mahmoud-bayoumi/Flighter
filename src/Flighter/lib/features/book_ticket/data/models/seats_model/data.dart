import 'seat.dart';

class Data {
  int? ticketId;
  List<Seat>? seats;

  Data({this.ticketId, this.seats});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ticketId: json['ticketId'] as int?,
        seats: (json['seats'] as List<dynamic>?)
            ?.map((e) => Seat.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'ticketId': ticketId,
        'seats': seats?.map((e) => e.toJson()).toList(),
      };
}
