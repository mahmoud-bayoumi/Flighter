class Data {
  String? from;
  String? to;
  String? departureDate;
  String? departureTime;
  String? flightNumber;
  String? gate;
  String? className;
  List<dynamic> selectedSeats;
  String? ticketCode;

  Data({
    this.from,
    this.to,
    this.departureDate,
    this.departureTime,
    this.flightNumber,
    this.gate,
    this.className,
    required this.selectedSeats,
    this.ticketCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        from: json['from'] as String?,
        to: json['to'] as String?,
        departureDate: json['departureDate'] as String?,
        departureTime: json['departureTime'] as String?,
        flightNumber: json['flightNumber'] as String?,
        gate: json['gate'] as String?,
        className: json['className'] as String?,
        selectedSeats: json['selectedSeats'] as List<dynamic>,
        ticketCode: json['ticketCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'departureDate': departureDate,
        'departureTime': departureTime,
        'flightNumber': flightNumber,
        'gate': gate,
        'className': className,
        'selectedSeats': selectedSeats,
        'ticketCode': ticketCode,
      };
}
