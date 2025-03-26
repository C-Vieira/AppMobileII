import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Sobre", style: TextStyle(color: Colors.white)),
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
            SizedBox(height: 30.0,),

            Text("Trabalho desenvolvido como método avaliativo para a disciplina de Programação Mobile II do curso de Engenharia de Software.", style: TextStyle(fontSize: 18.0),),
            SizedBox(height: 20.0,),
            Text("Professor/Orientador:      Rodrigo Plotze", style: TextStyle(fontSize: 18.0),),
            Text("Desenvolvedor:  Caio Vieira, RA: 838475", style: TextStyle(fontSize: 18.0),),
          ],
        ),
      )
    );
  }
}