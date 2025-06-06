import 'package:app_mobile2/controller/book_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

        child: FutureBuilder<DocumentSnapshot>(
          future: ctrl.getCurrentBook(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(snapshot.hasError){
              return Text("Erro ${snapshot.error}");
            }else{
              DocumentSnapshot currBook = snapshot.data as DocumentSnapshot;

              String title = currBook['title'];
              String subtitle = currBook['subtitle'];
              String description = currBook['description'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Título: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(title, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.0,),
                  Text("Subtítulo: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.0,),
                  Text("Descrição: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(description, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.0,),
                ],
              );
            }
          },
        ) 
      ),
    );
  }
}