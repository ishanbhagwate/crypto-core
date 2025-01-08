import '../../domain/entities/user.dart';

class AuthUserModel extends User {
  final String name;
  final String password;
  final String username;
  final String email;
  final String id;

  AuthUserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.password,
    required this.username,
    required super.refreshToken,
    required super.accessToken,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        password: json['password'],
        refreshToken: json['refreshToken'],
        username: json['username'],
        accessToken: 'token');
  }

  Map<String, dynamic> toJson() {
    return {
      'token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
