import 'package:app_mobile2/model/book_model.dart';
import 'package:flutter/material.dart';

class BookController extends ChangeNotifier {
  final List<Book> _books = [
    Book(title: "Title1", subtitle: "Subtitle1"),
    Book(title: "Title2", subtitle: "Subtitle2"),
    Book(title: "Title3", subtitle: "Subtitle3"),
    Book(title: "Title4", subtitle: "Subtitle4"),
    Book(title: "Title5", subtitle: "Subtitle5"),
    Book(title: "Title6", subtitle: "Subtitle6"),
    Book(title: "Title7", subtitle: "Subtitle7"),
    Book(title: "Title8", subtitle: "Subtitle8"),
    Book(title: "Title9", subtitle: "Subtitle9"),
    Book(title: "Title10", subtitle: "Subtitle10"),
  ];

  bool _visualizarLista = true;

  List<Book> get books => _books;
  bool get visualizarLista => _visualizarLista;

  void alterarVisualizacao(valor){
    _visualizarLista = valor;
    notifyListeners();
  }

  void addBook(String title, String subtitle){
    _books.add(Book(title: title, subtitle: subtitle));
    notifyListeners();
  }

  void removeBook(index){
    _books.removeAt(index);
    notifyListeners();
  }
}