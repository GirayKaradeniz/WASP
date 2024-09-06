import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wasp_frontend/pages/login_page.dart';
import '../resources/app_resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(AppAssets.waspSplashToSignIn),
          )
        ],
      ),
      nextScreen: LoginPage(),
      splashIconSize: 400,
      backgroundColor: AppColors.pageBackground,
    );
  }
}
