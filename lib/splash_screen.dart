import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      // ignore: use_build_context_synchronously
      context.go('/');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Animate(
        child: Center(
          child: Image.asset('assets/images/logo.png'),
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
  }
}
