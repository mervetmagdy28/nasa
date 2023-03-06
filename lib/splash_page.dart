import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nasa/constants.dart';
import 'package:nasa/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        splash: Image.asset(nasaImage,),
        splashIconSize: MediaQuery.of(context).size.width*.8,
        nextScreen: const LoginPage());
  }
}
