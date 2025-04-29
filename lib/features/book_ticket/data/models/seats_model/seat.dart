class Seat {
  int? seatId;
  String? seatName;
  bool? isBooked;

  Seat({this.seatId, this.seatName, this.isBooked});

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        seatId: json['seatId'] as int?,
        seatName: json['seatName'] as String?,
        isBooked: json['isBooked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'seatId': seatId,
        'seatName': seatName,
        'isBooked': isBooked,
      };
}
