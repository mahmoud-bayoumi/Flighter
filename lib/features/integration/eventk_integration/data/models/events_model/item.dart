class Item {
  int? eventId;
  String? eventName;
  DateTime? startDate;
  String? eventPicture;
  double? longitude;
  double? latitude;

  Item({
    this.eventId,
    this.eventName,
    this.startDate,
    this.eventPicture,
    this.longitude,
    this.latitude,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        eventId: json['eventId'] as int?,
        eventName: json['eventName'] as String?,
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate'] as String),
        eventPicture: json['eventPicture'] as String?,
        longitude: (json['longitude'] as num?)?.toDouble(),
        latitude: (json['latitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'eventId': eventId,
        'eventName': eventName,
        'startDate': startDate?.toIso8601String(),
        'eventPicture': eventPicture,
        'longitude': longitude,
        'latitude': latitude,
      };
}
