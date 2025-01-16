import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, User>> login(String email, String password);
  Future<Either<String, User>> signup(
      String email, String password, String name, String username);
  Future<Either<String, User>> refreshToken(String refreshToken);
  Future<void> logout();
  Future<Either<String, void>> forgotPassword(String email);
  Future<Either<String, void>> resetPassword(
      String email, int otp, String newPassword);
}
