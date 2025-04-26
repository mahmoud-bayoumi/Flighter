class Airline {
  int? companyId;
  String? companyName;

  Airline({this.companyId, this.companyName});

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        companyId: json['companyId'] as int?,
        companyName: json['companyName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'companyId': companyId,
        'companyName': companyName,
      };
}
