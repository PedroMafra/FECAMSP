// ignore_for_file: prefer_const_constructors
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'view/login.dart';
import 'view/cadastro.dart';
import 'view/recuperar.dart';
import 'view/menu.dart';
import 'view/sobre.dart';
import 'view/mapa.dart';
import 'view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'FECAM SP',
        initialRoute: 'login',
        routes: {
        'login': (context) => LoginView(),
        'cadastro': (context) => CadastroView(),
        'recuperar': (context) => RecuperarView(),
        'menu': (context) => MenuView(),
        'sobre': (context) => SobreView(),
        'mapa': (context) => MapaView(),
        'splash': (context) => SplashView(),
      },
      ),
    ),
  );

}
