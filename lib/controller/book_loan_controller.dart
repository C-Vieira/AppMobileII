import 'package:app_mobile2/controller/user_controller.dart';
import 'package:app_mobile2/model/book_loan_model.dart';
import 'package:app_mobile2/view/components/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookLoanController extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  void addLoan(context, BookLoan loan){
    FirebaseFirestore.instance
      .collection('loans')
      .add(loan.toJson())
      .then(
        (value) => showMessage(context, 'Empréstimo adicionado com suceso'),
      )
      .catchError(
        (error) => showMessage(context, 'Erro ao adicionar empréstimo')
      );
  }

  void editLoan(context, id, BookLoan loan){
    FirebaseFirestore.instance
      .collection('loans')
      .doc(id)
      .update(
        loan.toJson(),
      )
      .then(
        (value) => showMessage(context, 'Empréstimo atualizado com sucesso!'),
      )
      .catchError(
        (error) => showMessage(context, 'Erro ao atualizar empréstimo'),
      );
  }

  void removeLoan(context, id){
    FirebaseFirestore.instance
      .collection('loans')
      .doc(id)
      .delete()
      .then(
        (value) => showMessage(context, 'Empréstimo excluído com sucesso'),
      )
      .catchError(
        (error) => showMessage(context, 'Erro ao excluir empréstimo'),
      );
  }

  Stream<QuerySnapshot> listLoans(){
    var result = db
      .collection('loans')
      .where('userUid', isEqualTo: UserController().getCurrentUserId());

    return result.snapshots();
  }
}