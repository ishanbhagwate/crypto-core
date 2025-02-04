import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, User>> login(
    String email,
    String? password,
    bool isSocial,
    String? provider,
    String? providerId,
    String? deviceInfo,
    String? ipAddress,
  );
  Future<Either<String, User>> signup(
    String email,
    String name,
    String? password,
    bool isSocial,
    String? provider,
    String? providerId,
    String? deviceInfo,
    String? ipAddress,
  );
  Future<Either<String, User>> refreshToken(String refreshToken);
  Future<void> logout();
  Future<Either<String, void>> forgotPassword(String email);
  Future<Either<String, void>> resetPassword(
      String email, int otp, String newPassword);
  Future<Either<String, User>> appStarted();
}
