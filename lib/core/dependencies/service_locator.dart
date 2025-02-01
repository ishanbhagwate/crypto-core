import 'package:crypto_core/core/services/token_service.dart';
import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:crypto_core/features/authentication/data/datasources/remote_data_source.dart';
import 'package:crypto_core/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:crypto_core/features/authentication/domain/usecases/forgot_password_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/login_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/refresh_token_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/domain/respositories/auth_repository.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //core
  sl.registerLazySingleton(() {
    final dio = Dio();
    return dio;
  });
  sl.registerLazySingleton(
    () => FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    ),
  );
  sl.registerLazySingleton(
    () => TokenStorageService(sl()),
  );
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() async => prefs);

  sl.registerLazySingleton(
    () => TokenService(sl(), sl()),
  );

  //theme
  // sl.registerLazySingleton(() => ThemeNotifier());

  //auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDateSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton(
    () => LoginUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => SignupUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => LogoutUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => RefreshTokenUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ForgotPasswordUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ResetPasswordUsecase(sl()),
  );

  //news

  await sl.allReady();
}
