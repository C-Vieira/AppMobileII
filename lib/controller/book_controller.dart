import 'package:app_mobile2/model/book_model.dart';
import 'package:app_mobile2/view/components/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookController extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

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

  void editBook(context, id, Book book){
    FirebaseFirestore.instance
      .collection('books')
      .doc(id)
      .update(
        book.toJson(),
      )
      .then(
        (value) => showMessage(context, 'Livro atualizado com sucesso!'),
      )
      .catchError(
        (error) => showMessage(context, 'Erro ao atualizar livro'),
      );
  }

  Future<void> removeBook(context, id) async {
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

    // Also remove associated loans
    CollectionReference loans = db.collection('loans');

    loans
      .where('bookUid', isEqualTo: id)
      .get()
      .then(
        (result) {
          for (var doc in result.docs) {
            loans.doc(doc.id).delete();
          }
        }
      )
      .catchError(
        // ignore: invalid_return_type_for_catch_error
        (error) => showMessage(context, 'Erro ao excluir empréstimos associados'),
      );
  }

  Stream<QuerySnapshot> listBooks(String field){
    var result = db
      .collection('books')
      .where('uid')
      .orderBy(field);

    return result.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getCurrentBook() async {
    CollectionReference books = db.collection('books');

    Future<DocumentSnapshot<Object?>> result = books.doc(currentBookId).get();

    return result;
  }
}