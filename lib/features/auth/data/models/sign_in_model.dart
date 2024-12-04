class SignInModel {
  String? userName;
  String? email;
  RoleModel roles;
  String? token;
  String? refreshTokenExpiration;

  SignInModel({
    this.userName,
    this.email,
    required this.roles,
    this.token,
    this.refreshTokenExpiration,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        roles: RoleModel.fromJson(json['roles']),
        token: json['token'] as String?,
        refreshTokenExpiration: json['refreshTokenExpiration'] == null
            ? null
            : json['refreshTokenExpiration'] as String,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'roles': roles,
        'token': token,
        'refreshTokenExpiration': refreshTokenExpiration?.toString(),
      };
}

class RoleModel {
  String role;
  RoleModel({required this.role});
  factory RoleModel.fromJson(jsonData) {
    return RoleModel(role: jsonData[0]);
  }
}
