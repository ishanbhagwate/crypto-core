import 'package:crypto_core/features/authentication/data/models/auth_user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';

abstract class AuthRemoteDateSource {
  Future<AuthUserModel> login(String email, String password);
  Future<void> logout();
  Future<AuthUserModel> refreshToken(String refreshToken);
  Future<AuthUserModel> signup(
      String email, String password, String name, String username);
}

class AuthRemoteDateSourceImpl extends AuthRemoteDateSource {
  final Dio dio;

  AuthRemoteDateSourceImpl(this.dio);

  @override
  Future<AuthUserModel> login(String email, String password) async {
    final response = await dio.post('path', data: {
      email,
      password,
    });

    if (response.statusCode == 200) {
      //save token

      return AuthUserModel.fromJson(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  }

  @override
  Future<AuthUserModel> signup(
      String email, String password, String name, String username) async {
    // TODO: implement signup
    await Future.delayed(
      2.seconds,
      () {
        throw UnimplementedError();
      },
    );


  }

  @override
  Future<void> logout() async {
    //TODO: clear saved tokens

    await dio.post('path');
  }

  @override
  Future<AuthUserModel> refreshToken(String refreshToken) async {
    final response = await dio.post('path', data: {
      'refresh_token': refreshToken,
    });

    if (response.statusCode == 200) {
      //save token

      return AuthUserModel.fromJson(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
