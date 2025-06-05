import 'package:app_mobile2/model/book_model.dart';
import 'package:app_mobile2/view/components/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookController extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  /*final List<Book> _books = [
    Book(title: "Java: Como Programar", subtitle: "10º Edição", borrowTime: 14,
    descripton: "Tudo sobre a linguagem de programação Java 8.0! Aprenda com explicações, exemplos e projetos práticos do básico ao avançado."),
    Book(title: "Arquitetura e Organização de Computadores", subtitle: "8º Edição", borrowTime: 14,),
    Book(title: "Design Patterns", subtitle: "Elements of Reusable Object Oriented Software", borrowTime: 14),
    Book(title: "Cálculo Integral e Diferencial", subtitle: "5º Edição", borrowTime: 14),
    Book(title: "Sistemas Operacionais", subtitle: "6º Edição", borrowTime: 14),
    Book(title: "Sistemas Distribuídos", subtitle: "4º Edição", borrowTime: 14),
  ];*/
  //int currentBookIndex = 0;

  //List<Book> get books => _books;

  /*void addBook(String title, String subtitle, int borrowTime, String descripton){
    _books.add(Book(title: title, subtitle: subtitle, borrowTime: borrowTime, descripton: descripton));
    notifyListeners();
  }*/

  String currentBookId = '';

  void addBook(context, Book book){
    FirebaseFirestore.instance
      .collection('books')
      .add(book.toJson())
      .then(
        (value) => showMessage(context, 'Livro adicionado com suceso'),
      )
      .catchError(
        (error) => showMessage(context, 'Erro ao adicionar livro')
      );
  }

  /*void editBook(String title, String subtitle, int borrowTime, String descripton){
    _books[currentBookIndex].title = title;
    _books[currentBookIndex].subtitle = subtitle;
    _books[currentBookIndex].borrowTime = borrowTime;
    if(descripton.isEmpty){
      _books[currentBookIndex].descripton = "Sem descrição...";
    }else{
      _books[currentBookIndex].descripton = descripton;
    }
    notifyListeners();
  }*/

  void editBook(context, id, Book book){
    FirebaseFirestore.instance
      .collection('books')
      .doc(id)
      .update(
        book.toJson(),
      )
      .then(
        (value) => showMessage(context, 'Tarefa atualizada com sucesso!'),
      )
      .catchError(
        (error) => showMessage(context, 'Erro ao atualizar tarefa'),
      );
  }

  /*void removeBook(index){
    _books.removeAt(index);
    notifyListeners();
  }*/

  void removeBook(context, id){
    FirebaseFirestore.instance
      .collection('books')
      .doc(id)
      .delete()
      .then(
        (value) => showMessage(context, 'Livro excluído com sucesso'),
      )
      .catchError(
        (error) => showMessage(context, 'Erro ao excluir livro'),
      );
  }

  Stream<QuerySnapshot> listBooks(){
    var result = db
      .collection('books')
      .where('uid');

    return result.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getCurrentBook() async {
    CollectionReference books = db.collection('books');

    Future<DocumentSnapshot<Object?>> result = books.doc(currentBookId).get();

    return result;
  }

  CollectionReference getBooks(){
    return db.collection('books');
  }
}