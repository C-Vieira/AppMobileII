import 'package:app_mobile2/model/book_model.dart';
import 'package:flutter/material.dart';

class BookController extends ChangeNotifier {
  final List<Book> _books = [
    Book(title: "Java: Como Programar", subtitle: "10º Edição",
    descripton: "Tudo sobre a linguagem de programação Java 8.0! Aprenda com explicações, exemplos e projetos práticos do básico ao avançado."),
    Book(title: "Arquitetura e Organização de Computadores", subtitle: "8º Edição"),
    Book(title: "Design Patterns", subtitle: "Elements of Reusable Object Oriented Software"),
    Book(title: "Cálculo Integral e Diferencial", subtitle: "5º Edição"),
    Book(title: "Sistemas Operacionais", subtitle: "6º Edição"),
    Book(title: "Sistemas Distribuídos", subtitle: "4º Edição"),
  ];
  int currentBookIndex = 0;

  List<Book> get books => _books;

  void addBook(String title, String subtitle, String descripton){
    _books.add(Book(title: title, subtitle: subtitle, descripton: descripton));
    notifyListeners();
  }

  void removeBook(index){
    _books.removeAt(index);
    notifyListeners();
  }
}