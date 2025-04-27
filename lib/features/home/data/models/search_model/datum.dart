class TicketData {
  int? ticketId;
  String? price;
  String? from;
  String? to;
  String? departureDate;
  String? departureTime;
  String? arrivalDate;
  String? arrivalTime;
  int? durationInMinutes;
  String? companyName;

  TicketData({
    this.ticketId,
    this.price,
    this.from,
    this.to,
    this.departureDate,
    this.departureTime,
    this.arrivalDate,
    this.arrivalTime,
    this.durationInMinutes,
    this.companyName,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) => TicketData(
        ticketId: json['ticketId'] as int?,
        price: json['price'] as String?,
        from: json['from'] as String?,
        to: json['to'] as String?,
        departureDate: json['departureDate'] as String?,
        departureTime: json['departureTime'] as String?,
        arrivalDate: json['arrivalDate'] as String?,
        arrivalTime: json['arrivalTime'] as String?,
        durationInMinutes: json['durationInMinutes'] as int?,
        companyName: json['companyName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ticketId': ticketId,
        'price': price,
        'from': from,
        'to': to,
        'departureDate': departureDate,
        'departureTime': departureTime,
        'arrivalDate': arrivalDate,
        'arrivalTime': arrivalTime,
        'durationInMinutes': durationInMinutes,
        'companyName': companyName,
      };
}
