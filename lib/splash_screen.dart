import 'package:crypto_core/common/navigation/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<AuthBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state);
        if (state is AuthAuthenticated) {
          context.go(RoutePaths.home.path);
        }
        if (state is AuthError) {
          context.go(RoutePaths.getStarted.path);
        }
        if (state is AuthUnauthenticated) {
          context.go(RoutePaths.getStarted.path);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Animate(
            child: Center(
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Image.asset(
                    context.read<ThemeBloc>().state.themeMode == ThemeMode.light
                        ? 'assets/images/cryptocore_logo_dark.png'
                        : 'assets/images/cryptocore_logo_light.png',
                  );
                },
              ),
            ),
          )
              .fadeIn(
                duration: 350.ms,
                curve: Curves.easeInOutCubic,
              )
              .scaleXY(
                duration: 600.ms,
                begin: 0.6,
              ),
        );
      },
    );
  }
}
