import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  final TokenStorageService _tokenStorageService;

  DioClient(this._dio, this._tokenStorageService) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await _tokenStorageService.getAccessToken();
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }

        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          // final success = q
        }
      },
      onResponse: (response, handler) {},
    ));
  }
}
