import 'package:app_mobile2/controller/book_controller.dart';
import 'package:app_mobile2/view/about_view.dart';
import 'package:app_mobile2/view/add_book_view.dart';
import 'package:app_mobile2/view/home_view.dart';
import 'package:app_mobile2/view/list_book_view.dart';
import 'package:app_mobile2/view/login_view.dart';
import 'package:app_mobile2/view/operations_view.dart';
import 'package:app_mobile2/view/recover_password_view.dart';
import 'package:app_mobile2/view/register_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final g = GetIt.instance;

void main() {
  g.registerSingleton<BookController>(BookController());  

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
        'register' : (context) => const RegisterView(),
        'home' : (context) => const HomeView(),
        'operations' : (context) => const OperationsView(),
        'addBook' : (context) => const AddBookView(),
        'viewBooks' : (context) => const ListBookView(),
      },
    );
  }
}
