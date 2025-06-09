import 'package:app_mobile2/controller/book_controller.dart';
import 'package:app_mobile2/controller/book_loan_controller.dart';
import 'package:app_mobile2/controller/user_controller.dart';
import 'package:app_mobile2/firebase_options.dart';
import 'package:app_mobile2/view/about_view.dart';
import 'package:app_mobile2/view/add_book_view.dart';
import 'package:app_mobile2/view/book_details_view.dart';
import 'package:app_mobile2/view/edit_book_view.dart';
import 'package:app_mobile2/view/home_view.dart';
import 'package:app_mobile2/view/list_book_view.dart';
import 'package:app_mobile2/view/login_view.dart';
import 'package:app_mobile2/view/recover_password_view.dart';
import 'package:app_mobile2/view/register_view.dart';
import 'package:app_mobile2/view/search_book_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final g = GetIt.instance;

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  g.registerSingleton<BookController>(BookController());  
  g.registerSingleton<UserController>(UserController());  
  g.registerSingleton<BookLoanController>(BookLoanController());  

  runApp(
    /*DevicePreview(
      enabled: true,
      builder: (context) => const MainApp()
    ),*/
    const MainApp(),
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
        'addBook' : (context) => const AddBookView(),
        'viewBooks' : (context) => const ListBookView(),
        'bookDetails' : (context) => const BookDetailsView(),
        'editBook' : (context) => const EditBookView(),
        'searchBook' : (context) => const SearchBookView(),
      },
    );
  }
}
