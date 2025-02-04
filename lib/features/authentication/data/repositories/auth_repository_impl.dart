import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:crypto_core/features/authentication/data/datasources/remote_data_source.dart';
import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDateSource;
  final TokenStorageService tokenStorageService;

  AuthRepositoryImpl(this.remoteDateSource, this.tokenStorageService);

  @override
  Future<Either<String, User>> login(
    String email,
    String? password,
    bool isSocial,
    String? provider,
    String? providerId,
    String? deviceInfo,
    String? ipAddress,
  ) async {
    try {
      final user = await remoteDateSource.login(
        email,
        password,
        isSocial,
        provider,
        providerId,
        deviceInfo,
        ipAddress,
      );

      print(user.name);
      print(user.accessToken);
      print(user.refreshToken);

      //save tokens
      await tokenStorageService.saveTokens(user.accessToken, user.refreshToken);

      return Right(user);
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either<String, User>> signup(
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
      final user = await remoteDateSource.signup(
        email,
        name,
        password,
        isSocial,
        provider,
        providerId,
        deviceInfo,
        ipAddress,
      );

      //save tokens
      await tokenStorageService.saveTokens(user.accessToken, user.refreshToken);

      return Right(user);
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<void> logout() async {
    //delete tokens

    String token = await tokenStorageService.getRefreshToken() ?? '';
    await remoteDateSource.logout(token);

    await tokenStorageService.clearTokens();
    return;
  }

  @override
  Future<Either<String, User>> refreshToken(String refreshToken) async {
    try {
      final user = await remoteDateSource.refreshToken(refreshToken);

      //save tokens
      await tokenStorageService.saveTokens(user.accessToken, user.refreshToken);

      return Right(user);
    } catch (e) {
      return Left('Token refresh failed: $e');
    }
  }

  @override
  Future<Either<String, void>> forgotPassword(String email) async {
    return Left('Forgot password functionality is not implemented yet');
  }

  @override
  Future<Either<String, void>> resetPassword(
      String email, int otp, String newPassword) async {
    return Left('Reset password functionality is not implemented yet');
  }

  @override
  Future<Either<String, User>> appStarted() async {
    String? accessToken = await tokenStorageService.getAccessToken();
    String? refreshToken = await tokenStorageService.getRefreshToken();

    if (accessToken == null) {
      //logout
      await tokenStorageService.clearTokens();
      return Left('Please login again.');
    } else if (JwtDecoder.isExpired(accessToken) && refreshToken != null) {
      //fetch new token
      final user = await remoteDateSource.refreshToken(refreshToken);

      //save tokens
      await tokenStorageService.saveTokens(user.accessToken, user.refreshToken);

      return Right(user);
    } else if (refreshToken != null) {
      //logged in
      return Right(User(accessToken: accessToken, refreshToken: refreshToken));
    } else {
      //logout
      await tokenStorageService.clearTokens();
      return Left('Please login again.');
    }
  }
}
