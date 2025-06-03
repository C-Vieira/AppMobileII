import 'package:app_mobile2/model/book_loan_model.dart';
import 'package:app_mobile2/model/book_model.dart';
import 'package:app_mobile2/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final List<MyUser> _users = [
    MyUser(name: "Admin", email: "admin@email.com", phoneNumber: "1111111111", password: "admin"),
  ];
  int currentUserIndex = 0;

  List<MyUser> get users => _users;

/*  void addUser(String name, String email, String phoneNumber, String password){
    _users.add(MyUser(name: name, email: email, phoneNumber: phoneNumber, password: password));
    notifyListeners();
  }*/

/*  bool login(String givenEmail, String givenPassword){
    bool found = false;
    for (int i = 0; i < _users.length; i++) {
      if((_users[i].email == givenEmail) && (_users[i].password == givenPassword)){
        found = true;
        currentUserIndex = i;
      }
    }
    return found;
  }*/

  void addUser(context, name, email, phoneNumber, password){
    FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((result) {
        // Armazenar informações adicionais no Firestore
        FirebaseFirestore.instance.collection('usuarios').add({
          "uid": result.user!.uid.toString(),
          "name": name,
          "phoneNumber": phoneNumber,
        });
        showMessage(context, 'Usuário criado com sucesso');
      }).catchError((e) {
        switch(e.code){
          case 'email-already-in-use':
            showMessage(context, 'Este email já foi cadastrado');
            break;
          case 'invalid-email':
            showMessage(context, 'Email inválido');
            break;
          case 'weak-password':
            showMessage(context, 'Senha fraca');
            break;
          default:
            showMessage(context, e.code.toString());
            break;
        }
      });
  }

  void login(context, email, password){
    FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then((result) {
        // Sucesso
        showMessage(context, 'Usuário autenticado com sucesso');
        Navigator.pushReplacementNamed(context, 'home');
      }).catchError((e) {
        switch(e.code){
          case 'invalid-credential':
            showMessage(context, 'Credenciais inválidas');
            break;
          case 'user-not-found':
            showMessage(context, 'Usuário não encontrado');
            break;
          case 'wrong-password':
            showMessage(context, 'Senha incorreta');
            break;
          default:
            showMessage(context, e.code.toString());
            break;
        }
      });
  }

  void recoverPassword(context, String email){
    FirebaseAuth.instance
      .sendPasswordResetEmail(email: email)
      .then((result) {
        showMessage(context, 'Um email de recuperação foi enviado para $email');
      }).catchError((e) {
        switch(e.code){
          case 'user-not-found':
            showMessage(context, 'Usuário não encontrado');
            break;
          default:
            showMessage(context, e.code.toString());
            break;
        }
      });
  }

  void addLoan(Book book, int userId){
    _users[userId].loans.add(BookLoan(book: book));
    notifyListeners();
  }

  void removeLoan(index, int userId){
    _users[userId].loans.removeAt(index);
    notifyListeners();
  }

  void showMessage(context, String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(seconds: 3),) 
    );
  }
}