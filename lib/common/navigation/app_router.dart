import 'package:crypto_core/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:crypto_core/features/authentication/presentation/pages/get_started_page.dart';
import 'package:crypto_core/features/authentication/presentation/pages/login_page.dart';
import 'package:crypto_core/features/authentication/presentation/pages/signup_page.dart';
import 'package:crypto_core/home.dart';
import 'package:crypto_core/splash_screen.dart';

import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation: '/splash',
      redirect: (context, state) {
        //check if logged in

        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => MainHome(),
        ),
        GoRoute(
          path: '/splash',
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignupPage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/getStarted',
          builder: (context, state) => GetStartedPage(),
        ),
        GoRoute(
          path: '/forgotPassword',
          builder: (context, state) => ForgotPasswordPage(),
        ),
      ]);
}
