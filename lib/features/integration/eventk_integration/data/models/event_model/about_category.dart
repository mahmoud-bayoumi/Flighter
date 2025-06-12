class AboutCategory {
  int? categoryId;
  String? categoryName;

  AboutCategory({this.categoryId, this.categoryName});

  factory AboutCategory.fromJson(Map<String, dynamic> json) => AboutCategory(
        categoryId: json['categoryId'] as int?,
        categoryName: json['categoryName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'categoryId': categoryId,
        'categoryName': categoryName,
      };
}
