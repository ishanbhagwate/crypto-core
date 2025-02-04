import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AppStartedUsecase {
  final AuthRepository authRepository;

  AppStartedUsecase(this.authRepository);

  Future<Either<String,User>> call() {
    return authRepository.appStarted();
  }
}
