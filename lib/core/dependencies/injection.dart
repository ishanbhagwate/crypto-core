import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:crypto_core/features/authentication/data/datasources/remote_data_source.dart';
import 'package:crypto_core/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:crypto_core/features/authentication/domain/usecases/login_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/refresh_token_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/domain/respositories/auth_repository.dart';

final s1 = GetIt.asNewInstance();

void init() {
  //dio
  s1.registerLazySingleton(() => Dio());

  //flutter secure storage
  s1.registerLazySingleton(
    () => FlutterSecureStorage(),
  );

  s1.registerLazySingleton(
    () => TokenStorageService(s1()),
  );

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
    () => RefreshTokenUsecase(s1()),
  );

  //news
}
