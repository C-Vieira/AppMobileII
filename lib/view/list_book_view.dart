import 'package:flutter/material.dart';

class ListBookView extends StatefulWidget {
  const ListBookView({super.key});

  @override
  State<ListBookView> createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Visualizar Livros", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      /*
       *  Body
       */
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 30),

        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}