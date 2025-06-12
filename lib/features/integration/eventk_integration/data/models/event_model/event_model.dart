import 'about.dart';

class EventModel {
  int? eventId;
  About? about;
  String? eventName;
  DateTime? startDate;
  DateTime? endDate;
  String? eventPicture;
  String? organizationName;
  int? organizationId;
  double? latitude;
  double? longitude;
  int? interestedPeople;
  bool? isPaid;
  int? minPrice;
  double? maxPrice;

  EventModel({
    this.eventId,
    this.about,
    this.eventName,
    this.startDate,
    this.endDate,
    this.eventPicture,
    this.organizationName,
    this.organizationId,
    this.latitude,
    this.longitude,
    this.interestedPeople,
    this.isPaid,
    this.minPrice,
    this.maxPrice,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventId: json['eventId'] as int?,
        about: json['about'] == null
            ? null
            : About.fromJson(json['about'] as Map<String, dynamic>),
        eventName: json['eventName'] as String?,
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate'] as String),
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
        eventPicture: json['eventPicture'] as String?,
        organizationName: json['organizationName'] as String?,
        organizationId: json['organizationId'] as int?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        interestedPeople: json['interestedPeople'] as int?,
        isPaid: json['isPaid'] as bool?,
        minPrice: json['minPrice'] as int?,
        maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'eventId': eventId,
        'about': about?.toJson(),
        'eventName': eventName,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'eventPicture': eventPicture,
        'organizationName': organizationName,
        'organizationId': organizationId,
        'latitude': latitude,
        'longitude': longitude,
        'interestedPeople': interestedPeople,
        'isPaid': isPaid,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
      };
}
