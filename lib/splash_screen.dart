import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'core/notifiers/theme_notifier.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeNotifier themeNotifier;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      // ignore: use_build_context_synchronously
      context.go('/getStarted');
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    themeNotifier = Provider.of<ThemeNotifier>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthTokenExpired) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Session expired. Please log in again.')),
          );
          Navigator.pushReplacementNamed(context, '/getStarted');
        }
        if (state is AuthTokenRefreshed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Session refreshed.')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Animate(
            child: Center(
              child: Image.asset(
                themeNotifier.themeMode == ThemeMode.light
                    ? 'assets/images/cryptocore_logo_dark.png'
                    : 'assets/images/cryptocore_logo_light.png',
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
