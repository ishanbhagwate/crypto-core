import 'package:crypto_core/common/themes/app_theme.dart';

import 'package:crypto_core/core/dependencies/injection.dart';
import 'package:crypto_core/core/notifiers/theme_notifier.dart';
import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:crypto_core/features/authentication/domain/usecases/login_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/refresh_token_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:crypto_core/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'common/navigation/app_router.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => s1<ThemeNotifier>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            loginUsecase: s1<LoginUsecase>(),
            signupUsecase: s1<SignupUsecase>(),
            refreshTokenUsecase: s1<RefreshTokenUsecase>(),
            logoutUsecase: s1<LogoutUsecase>(),
            tokenStorageService: s1<TokenStorageService>(),
          ),
        ),
        // BlocProvider(
        //   create: (context) => NewsBloc(),
        // ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            title: 'CryptoCore',
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: themeNotifier.themeMode,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
