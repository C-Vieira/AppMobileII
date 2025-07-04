import 'package:app_mobile2/view/components/message.dart';
import 'package:app_mobile2/view/components/time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {

  void addUser(context, name, email, phoneNumber, password){
    FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((result) {
        // Armazenar informações adicionais no Firestore
        FirebaseFirestore.instance.collection('usuarios').add({
          "uid": result.user!.uid.toString(),
          "name": name,
          "phoneNumber": phoneNumber,
          "registerDate": getNow(),
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

  Future<String> getCurrentUserName() async{
    var userName = '';
    await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: getCurrentUserId())
      .get()
      .then((result) {
          userName = result.docs[0].data()['name'] ?? '';
      });

      return userName;
  }

  String getCurrentUserId(){
    final user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  void logout(){
    FirebaseAuth.instance.signOut();
  }
}