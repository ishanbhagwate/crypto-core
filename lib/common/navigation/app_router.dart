import 'package:crypto_core/common/pages/error_page.dart';
import 'package:crypto_core/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:crypto_core/features/authentication/presentation/pages/get_started_page.dart';
import 'package:crypto_core/features/authentication/presentation/pages/login_page.dart';
import 'package:crypto_core/features/authentication/presentation/pages/signup_page.dart';
import 'package:crypto_core/home.dart';
import 'package:crypto_core/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'route_paths.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation: RoutePaths.getStarted.path,
      redirect: (context, state) {
        //check if logged in

        return null;
      },
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: ErrorPage(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePaths.home.path,
          builder: (context, state) => MainHome(),
        ),
        GoRoute(
          path: RoutePaths.splash.path,
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: RoutePaths.signup.path,
          builder: (context, state) => SignupPage(),
        ),
        GoRoute(
          path: RoutePaths.login.path,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: RoutePaths.getStarted.path,
          builder: (context, state) => GetStartedPage(),
          
        ),
        GoRoute(
          path: RoutePaths.forgotPassword.path,
          builder: (context, state) => ForgotPasswordPage(),
        ),
      ]);
}
