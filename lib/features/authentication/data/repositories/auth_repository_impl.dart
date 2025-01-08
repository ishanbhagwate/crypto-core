import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:crypto_core/features/authentication/data/datasources/remote_data_source.dart';
import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDateSource remoteDateSource;
  final TokenStorageService tokenStorageService;

  AuthRepositoryImpl(this.remoteDateSource, this.tokenStorageService);

  @override
  Future<Either<String, User>> login(String email, String password) async {
    try {
      final user = await remoteDateSource.login(email, password);

      //save tokens
      await tokenStorageService.saveTokens(user.accessToken, user.refreshToken);

      return Right(user);
    } catch (e) {
      return Left('Login failed: $e');
    }
  }

  @override
  Future<Either<String, User>> signup(
      String email, String password, String name, String username) async {
    try {
      final user = await remoteDateSource.signup(
        email,
        password,
        name,
        username,
      );

      //save tokens
      await tokenStorageService.saveTokens(user.accessToken, user.refreshToken);

      return Right(user);
    } catch (e) {
      return Left('Signup failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    //delete tokens
    await tokenStorageService.clearTokens();

    await remoteDateSource.logout();
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
}
