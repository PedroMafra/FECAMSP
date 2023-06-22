// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_projetopedromafra/view/login.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('lib/images/logofecam.png'),
      logoWidth: 150,
      title: Text(
        '',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text('Carregando...'),
      durationInSeconds: 5,
      navigator: LoginView(),
    );
  }
}