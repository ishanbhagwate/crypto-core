import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../respositories/auth_repository.dart';

class RefreshTokenUsecase {
  final AuthRepository authRepository;

  RefreshTokenUsecase(this.authRepository);

  Future<Either<String, User>> call(String refreshToken) {
    return authRepository.refreshToken(refreshToken);
  }
}
