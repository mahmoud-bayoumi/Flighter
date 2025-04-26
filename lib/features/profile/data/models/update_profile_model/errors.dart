class Errors {
  List<String>? name;
  List<String>? dateOfBirth;

  Errors({this.name, this.dateOfBirth});

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        name: json['Name'] as List<String>?,
        dateOfBirth: json['DateOfBirth'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'DateOfBirth': dateOfBirth,
      };
}
