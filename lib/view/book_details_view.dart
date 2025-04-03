import 'package:app_mobile2/controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  final ctrl = GetIt.I.get<BookController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Detalhes do Livro", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      /*
       *  Body
       */
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Título: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(ctrl.books[ctrl.currentBookIndex].title, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10.0,),
            Text("Subtítulo: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(ctrl.books[ctrl.currentBookIndex].subtitle, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10.0,),
            Text("Descrição: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(ctrl.books[ctrl.currentBookIndex].descripton, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}