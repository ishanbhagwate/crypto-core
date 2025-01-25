import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<String, User>> call(
     String email,
     String? password,
     bool isSocial,
     String? provider,
     String? providerId,
     String? deviceInfo,
     String? ipAddress,
  ) {
    return repository.login(
      email,
      password,
      isSocial,
      provider,
      providerId,
      deviceInfo,
      ipAddress,
    );
  }
}
