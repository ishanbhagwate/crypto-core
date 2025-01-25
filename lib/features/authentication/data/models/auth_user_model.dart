import '../../domain/entities/user.dart';

class AuthUserModel extends User {
  final String name;
  final String? password;
  final String? username;
  final String email;
  final String id;
  final String? providerId;
  final String? provider;

  AuthUserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.password,
    required this.username,
    required this.providerId,
    required this.provider,
    required super.refreshToken,
    required super.accessToken,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['data']['id'],
      email: json['data']['email'],
      name: json['data']['name'],
      password: json['data']['password'],
      username: json['data']['username'],
      provider: json['data']['provider'],
      providerId: json['data']['providerId'],
      refreshToken: json['refreshToken'],
      accessToken: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
