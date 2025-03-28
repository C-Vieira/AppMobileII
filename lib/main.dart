import 'package:app_mobile2/view/about_view.dart';
import 'package:app_mobile2/view/login_view.dart';
import 'package:app_mobile2/view/recover_password_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp()
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Rotas de Navegação
      initialRoute: 'login',
      routes: {
        'login' : (context) => const LoginView(),
        'about' : (context) => const AboutView(),
        'recover' : (context) => const RecoverPasswordView(),
      },
    );
  }
}
