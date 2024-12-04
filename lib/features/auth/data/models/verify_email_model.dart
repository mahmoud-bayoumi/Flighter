class VerifyEmailModel {
  String? message;
  String? userName;
  String? email;
  RoleModel? roles;
  String? token;
  String? refreshTokenExpiration;

  VerifyEmailModel(
      {this.message,
      this.roles,
      this.email,
      this.userName,
      this.token,
      this.refreshTokenExpiration});

  factory VerifyEmailModel.fromJson(json) {
    return VerifyEmailModel(
      message: json['message'] ?? "Success",
      roles: RoleModel.fromJson(json['roles']),
      email: json['email'],
      userName: json['userName'],
      token: json['token'],
      refreshTokenExpiration: json['refreshTokenExpiration'],
    );
  }
}

class RoleModel {
  String role;
  RoleModel({required this.role});
  factory RoleModel.fromJson(jsonData) {
    return RoleModel(role: jsonData[0]);
  }
}
