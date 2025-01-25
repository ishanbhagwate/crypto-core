import 'package:crypto_core/core/constants/api_constants.dart';
import 'package:crypto_core/features/authentication/data/models/auth_user_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDateSource {
  Future<AuthUserModel> login(String email, String password);
  Future<void> logout();
  Future<AuthUserModel> refreshToken(String refreshToken);
  Future<AuthUserModel> signup(
      String email, String password, String name, String username);
  Future<void> forgotPassword(String email);
  Future<void> resetPassword(String email, int otp, String newPassword);
}

class AuthRemoteDateSourceImpl extends AuthRemoteDateSource {
  final Dio dio;

  AuthRemoteDateSourceImpl(this.dio);

  @override
  Future<AuthUserModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: {
          email,
          password,
        },
      );

      if (response.statusCode == 200) {
        return AuthUserModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthUserModel> signup(
      String email, String password, String name, String username) async {
    try {
      final response = await dio.post(
        ApiConstants.signup,
        data: {
          email,
          password,
          name,
          username,
        },
      );

      if (response.statusCode == 200) {
        return AuthUserModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e);
    }
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

  @override
  Future<void> forgotPassword(String email) {
    throw UnimplementedError();

    // try {
    //   // dio.post('path');
    // } catch (e) {
    //   throw Exception(e);
    // }
  }

  @override
  Future<void> resetPassword(String email, int otp, String newPassword) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
