import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignupUsecase {
  final AuthRepository repository;

  SignupUsecase(this.repository);

  Future<Either<String, User>> call(
    String email,
    String name,
    String? password,
    bool isSocial,
    String? provider,
    String? providerId,
    String? deviceInfo,
    String? ipAddress,
  ) {
    return repository.signup(
      email,
      name,
      password,
      isSocial,
      provider,
      providerId,
      deviceInfo,
      ipAddress,
    );
  }
}
