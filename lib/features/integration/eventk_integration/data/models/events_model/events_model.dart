import 'item.dart';

class EventsModel {
  List<Item>? items;
  int? pageNumber;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? pageSize;

  EventsModel({
    this.items,
    this.pageNumber,
    this.totalPages,
    this.hasPreviousPage,
    this.hasNextPage,
    this.pageSize,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        pageNumber: json['pageNumber'] as int?,
        totalPages: json['totalPages'] as int?,
        hasPreviousPage: json['hasPreviousPage'] as bool?,
        hasNextPage: json['hasNextPage'] as bool?,
        pageSize: json['pageSize'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'pageNumber': pageNumber,
        'totalPages': totalPages,
        'hasPreviousPage': hasPreviousPage,
        'hasNextPage': hasNextPage,
        'pageSize': pageSize,
      };
}
