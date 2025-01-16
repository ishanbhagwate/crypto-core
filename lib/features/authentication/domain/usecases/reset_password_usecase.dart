import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase(this.repository);

  Future<Either<String, void>> call(String email, int otp, String newPassword) {
    return repository.resetPassword(email , otp, newPassword);
  }
}
