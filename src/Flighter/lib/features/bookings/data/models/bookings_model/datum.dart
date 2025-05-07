class BookingData {
  String? guestname;
  String? companyName;
  String? from;
  String? to;
  String? departureDate;
  String? departureTime;
  String? arrivalDate;
  String? arrivalTime;
  dynamic returnDepartureDate;
  dynamic returnDepartureTime;
  String? returnArrivalDate;
  String? returnArrivalTime;
  int? durationInMinutes;
  String? className;
  String? flightNumber;
  String? gate;
  List<dynamic>? selectedSeats;
  String? ticketCode;
  String? baggageAllowance;
  DateTime? bookingDate;
  int amount;
  String? paymentStatus;
  int? bookingid;
  int? ticketid;
  BookingData(
      {this.guestname,
      this.companyName,
      this.from,
      this.to,
      this.departureDate,
      this.departureTime,
      this.arrivalDate,
      this.arrivalTime,
      this.returnDepartureDate,
      this.returnDepartureTime,
      this.returnArrivalDate,
      this.returnArrivalTime,
      this.durationInMinutes,
      this.className,
      this.flightNumber,
      this.gate,
      this.selectedSeats,
      this.ticketCode,
      this.baggageAllowance,
      this.bookingDate,
      this.amount = 0,
      this.paymentStatus,
      this.bookingid,
      this.ticketid});

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        guestname: json['guestname'] as String?,
        companyName: json['companyName'] as String?,
        from: json['from'] as String?,
        to: json['to'] as String?,
        departureDate: json['departureDate'] as String?,
        departureTime: json['departureTime'] as String?,
        arrivalDate: json['arrivalDate'] as String?,
        arrivalTime: json['arrivalTime'] as String?,
        returnDepartureDate: json['returnDepartureDate'] as dynamic,
        returnDepartureTime: json['returnDepartureTime'] as dynamic,
        returnArrivalDate: json['returnArrivalDate'] as String?,
        returnArrivalTime: json['returnArrivalTime'] as String?,
        durationInMinutes: json['durationInMinutes'] as int?,
        className: json['className'] as String?,
        flightNumber: json['flightNumber'] as String?,
        gate: json['gate'] as String?,
        selectedSeats: json['selectedSeats'] as List<dynamic>?,
        ticketCode: json['ticketCode'] as String?,
        baggageAllowance: json['baggageAllowance'] as String?,
        bookingDate: json['bookingDate'] == null
            ? null
            : DateTime.parse(json['bookingDate'] as String),
        amount: json['amount'] as int,
        paymentStatus: json['paymentStatus'] as String?,
        bookingid: json['bookingid'] as int?,
        ticketid: json['ticketid'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'guestname': guestname,
        'companyName': companyName,
        'from': from,
        'to': to,
        'departureDate': departureDate,
        'departureTime': departureTime,
        'arrivalDate': arrivalDate,
        'arrivalTime': arrivalTime,
        'returnDepartureDate': returnDepartureDate,
        'returnDepartureTime': returnDepartureTime,
        'returnArrivalDate': returnArrivalDate,
        'returnArrivalTime': returnArrivalTime,
        'durationInMinutes': durationInMinutes,
        'className': className,
        'flightNumber': flightNumber,
        'gate': gate,
        'selectedSeats': selectedSeats,
        'ticketCode': ticketCode,
        'baggageAllowance': baggageAllowance,
        'bookingDate': bookingDate?.toIso8601String(),
        'amount': amount,
        'paymentStatus': paymentStatus,
        'bookingid': bookingid,
        'ticketid': ticketid
      };
}
