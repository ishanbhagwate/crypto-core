import 'package:crypto_core/features/authentication/domain/respositories/auth_repository.dart';

class AppStartedUsecase {
  final AuthRepository authRepository;

  AppStartedUsecase(this.authRepository);

  Future<void> call() {
    return authRepository.appStarted();
  }
}
