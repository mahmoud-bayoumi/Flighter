class ProfileDataModel {
  final String? name;
  final String? dateOfBirth;
  final String? country;

  ProfileDataModel({this.name, this.dateOfBirth, this.country});

  factory ProfileDataModel.fromJson(json) {
    return ProfileDataModel(
      name: json['name'],
      dateOfBirth: json['dateOfBirth'],
      country: json['country'],
    );
  }
}
