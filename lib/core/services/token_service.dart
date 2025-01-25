import 'dart:async';

import 'package:crypto_core/features/authentication/domain/usecases/refresh_token_usecase.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'token_storage_service.dart';

class TokenService {
  final RefreshTokenUsecase refreshTokenUsecase;
  final TokenStorageService tokenStorageService;

  Timer? _timer;

  TokenService(this.refreshTokenUsecase, this.tokenStorageService);

  void start() {
    _timer = Timer.periodic(const Duration(minutes: 5), (_) async {
      await _checkToken();
    });
  }

  void stop() {
    _timer?.cancel();
  }

  Future<void> _checkToken() async {
    try {
      final refreshToken = await tokenStorageService.getRefreshToken();
      final accessToken = await tokenStorageService.getAccessToken();

      if (refreshToken == null || accessToken == null) return;

      if (JwtDecoder.isExpired(accessToken)) {
        final result = await refreshTokenUsecase(refreshToken);

        result.fold(
          (failure) => print('Token refresh failed: $failure'),
          (_) => print('Token successfully refreshed'),
        );
      }
    } catch (e) {
      print('Error during token check: $e');
    }
  }
}
