import 'package:crypto_core/core/constants/api_constants.dart';
import 'package:crypto_core/features/authentication/data/models/auth_user_model.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class AuthRemoteDataSource {
  Future<AuthUserModel> login(
    final String email,
    final String? password,
    final bool isSocial,
    final String? provider,
    final String? providerId,
    final String? deviceInfo,
    final String? ipAddress,
  );
  Future<void> logout(String token);
  // Future<void> appStarted();
  Future<AuthUserModel> refreshToken(String refreshToken);
  Future<AuthUserModel> signup(
    final String email,
    final String name,
    final String? password,
    final bool isSocial,
    final String? provider,
    final String? providerId,
    final String? deviceInfo,
    final String? ipAddress,
  );
  Future<void> forgotPassword(String email);
  Future<void> resetPassword(String email, int otp, String newPassword);
}

class AuthRemoteDateSourceImpl extends AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDateSourceImpl(this.dio);

  @override
  Future<AuthUserModel> login(
    String email,
    String? password,
    bool isSocial,
    String? provider,
    String? providerId,
    String? deviceInfo,
    String? ipAddress,
  ) async {
    try {
      if (isSocial) {
        final response = await dio.post(
          ApiConstants.socialLogin,
          data: {
            'email': email,
            'provider': provider,
            'providerId': providerId,
            'deviceInfo': deviceInfo,
            'ipAddress': ipAddress,
          },
        );

        if (response.statusCode == 200) {
          return AuthUserModel.fromJson(response.data);
        } else {
          throw 'Login failed: ${response.data['message']}';
        }
      } else {
        final response = await dio.post(
          ApiConstants.login,
          data: {
            'email': email,
            'password': password,
            'deviceInfo': deviceInfo,
            'ipAddress': ipAddress,
          },
        );

        if (response.statusCode == 200) {
          return AuthUserModel.fromJson(response.data);
        } else {
          throw 'Login failed: ${response.data['message']}';
        }
      }
    } on DioException catch (e) {
      throw 'Login failed: ${e.response?.data['message']}';
    }
  }

  @override
  Future<AuthUserModel> signup(
    String email,
    String name,
    String? password,
    bool isSocial,
    String? provider,
    String? providerId,
    String? deviceInfo,
    String? ipAddress,
  ) async {
    try {
      if (isSocial) {
        final response = await dio.post(
          ApiConstants.socialSignup,
          data: {
            'email': email,
            'name': name,
            'provider': provider,
            'providerId': providerId,
            'deviceInfo': deviceInfo,
            'ipAddress': ipAddress,
          },
        );

        if (response.statusCode == 200) {
          return AuthUserModel.fromJson(response.data);
        } else {
          throw 'Signup failed: ${response.data['message']}';
        }
      } else {
        final response = await dio.post(
          ApiConstants.signup,
          data: {
            'email': email,
            'name': name,
            'password': password,
            'deviceInfo': deviceInfo,
            'ipAddress': ipAddress,
          },
        );

        if (response.statusCode == 200) {
          return AuthUserModel.fromJson(response.data);
        } else {
          throw 'Signup failed: ${response.data['message']}';
        }
      }
    } on DioException catch (e) {
      throw 'Signup failed: ${e.response?.data['message']}';
    }
  }

  @override
  Future<void> logout(String token) async {
    try {
      String id = await JwtDecoder.decode(token)['userId'];

      final response = await dio.post(
        ApiConstants.logout,
        data: {
          'id': id,
          'token': token,
        },
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw 'Logout failed: ${e.response?.data['message']}';
    }
  }

  @override
  Future<AuthUserModel> refreshToken(String refreshToken) async {
    try {
      final response = await dio.post(
        ApiConstants.refreshToken,
        data: {
          'refreshToken': refreshToken,
        },
      );

      if (response.statusCode == 200) {
        return AuthUserModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw 'Refresh token failed: ${e.response?.data['message']}';
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

  // @override
  // Future<void> appStarted() async {
  //   try {
  //     //check the token and expiry

  //     final response = await dio.post(
  //       ApiConstants.logout,
  //       data: {
  //         'token': refreshToken,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       //save token

  //       // return AuthUserModel.fromJson(response.data);
  //     } else {
  //       throw Exception(response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     throw 'Logout failed: ${e.response?.data['message']}';
  //   }
  // }
}
