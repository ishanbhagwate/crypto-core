import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUsecase {
  final AuthRepository repository;

  ForgotPasswordUsecase(this.repository);

  Future<Either<String, void>> call(String email) {
    return repository.forgotPassword(email);
  }
}
