class Message {
  dynamic message;
  bool? isAuthenticated;
  String? userName;
  String? email;
  List<dynamic>? roles;
  String? token;
  DateTime? refreshTokenExpiration;

  Message({
    this.message,
    this.isAuthenticated,
    this.userName,
    this.email,
    this.roles,
    this.token,
    this.refreshTokenExpiration,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json['message'] as dynamic,
        isAuthenticated: json['isAuthenticated'] as bool?,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        roles: json['roles'] as List<dynamic>?,
        token: json['token'] as String?,
        refreshTokenExpiration: json['refreshTokenExpiration'] == null
            ? null
            : DateTime.parse(json['refreshTokenExpiration'] as String),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'isAuthenticated': isAuthenticated,
        'userName': userName,
        'email': email,
        'roles': roles,
        'token': token,
        'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
      };
}