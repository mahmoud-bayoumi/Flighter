import 'about_category.dart';

class About {
  String? description;
  List<AboutCategory>? aboutCategories;

  About({this.description, this.aboutCategories});

  factory About.fromJson(Map<String, dynamic> json) => About(
        description: json['description'] as String?,
        aboutCategories: (json['aboutCategories'] as List<dynamic>?)
            ?.map((e) => AboutCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'aboutCategories': aboutCategories?.map((e) => e.toJson()).toList(),
      };
}
