import 'package:app_mobile2/model/book_loan_model.dart';

class MyUser{
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  final List<BookLoan> loans = [];

  MyUser({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}