import 'package:flutter/material.dart';

class OperationsView extends StatefulWidget {
  const OperationsView({super.key});

  @override
  State<OperationsView> createState() => _OperationsViewState();
}

class _OperationsViewState extends State<OperationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Operações", style: TextStyle(color: Colors.white)),
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
            Text("Selecione das Opções Abaixo: ", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20.0,),
              /*
              *  Add new Book Button
              */
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  foregroundColor: Colors.white,
                  minimumSize: Size(400, 50), textStyle: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'addBook');
                },
                child: Text("Adicionar Livro"),
              ),
              SizedBox(height: 20.0,),
              /*
              *  View Books Button
              */
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  foregroundColor: Colors.white,
                  minimumSize: Size(400, 50), textStyle: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'viewBooks');
                },
                child: Text("Visualizar Livros"),
              ),
          ],
        )
      )
   );
  }
}