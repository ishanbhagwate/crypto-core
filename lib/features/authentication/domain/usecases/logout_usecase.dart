import '../respositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  Future<void> call() {
    return authRepository.logout();
  }
}
