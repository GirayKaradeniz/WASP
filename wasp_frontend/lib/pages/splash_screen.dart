import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wasp_frontend/pages/login_page.dart';
import 'package:wasp_frontend/resources/app_resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset(
          'WaspSignInRevised.json',
          width: 1080,
          height: 1920,
        ),
      ),
      nextScreen: LoginPage(),
      splashIconSize: 200,
      backgroundColor: AppColors.pageBackground,
    );
  }
}
