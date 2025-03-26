import 'package:flutter/material.dart';

class RecoverPasswordView extends StatelessWidget {
  const RecoverPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Recuperar Senha", style: TextStyle(color: Colors.white)),
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
            SizedBox(height: 30.0),
            /*
             *  Email Input Field
             */
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 20.0),
            /*
             *  Recover Password Button
             */
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.white,
                minimumSize: Size(400, 50), textStyle: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {},
              child: Text("Recuperar Senha"),
            ),
          ],
        )
      ),
    );
  }
}