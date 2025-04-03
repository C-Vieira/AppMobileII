import 'package:app_mobile2/model/user_model.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final List<User> _users = [
    User(name: "Admin", email: "admin@email.com", phoneNumber: "1111111111", password: "admin"),
  ];
  int currentUserIndex = 0;

  List<User> get users => _users;

  void addUser(String name, String email, String phoneNumber, String password){
    _users.add(User(name: name, email: email, phoneNumber: phoneNumber, password: password));
    notifyListeners();
  }

  void login(String givenEmail, String givenPassword){
    //User result = _users.firstWhere(
      //(user) => ((user.email == givenEmail) && (user.password == givenPassword)), orElse: () => );
    bool found = false;
    for (var user in _users) {
      if((user.email == givenEmail) && (user.password == givenPassword)) found = true;
    }

    if(found){
      //Login
    }
  }
}