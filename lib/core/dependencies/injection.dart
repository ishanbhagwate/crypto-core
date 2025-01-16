import 'package:crypto_core/core/notifiers/theme_notifier.dart';
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

final s1 = GetIt.asNewInstance();

Future<void> init() async {
  //dio
  s1.registerLazySingleton(() => Dio());

  //flutter secure storage
  s1.registerLazySingleton(
    () => FlutterSecureStorage(),
  );

  s1.registerLazySingleton(
    () => TokenStorageService(s1()),
  );

  //home
  final prefs = await SharedPreferences.getInstance();

  s1.registerLazySingleton(() => prefs);
  s1.registerLazySingleton(() => ThemeNotifier());

  //auth
  s1.registerLazySingleton<AuthRemoteDateSource>(
    () => AuthRemoteDateSourceImpl(s1()),
  );
  s1.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(s1(), s1()),
  );
  s1.registerLazySingleton(
    () => LoginUsecase(s1()),
  );
  s1.registerLazySingleton(
    () => SignupUsecase(s1()),
  );
  s1.registerLazySingleton(
    () => LogoutUsecase(s1()),
  );
  s1.registerLazySingleton(
    () => RefreshTokenUsecase(s1()),
  );
  s1.registerLazySingleton(
    () => ForgotPasswordUsecase(s1()),
  );
  s1.registerLazySingleton(
    () => ResetPasswordUsecase(s1()),
  );

  //news
}
