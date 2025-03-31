import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Cadastrar Conta", style: TextStyle(color: Colors.white)),
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
             *  Name Input Field
             */
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 20.0),
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
             *  Phone Number Input Field
             */
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Telefone",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 20.0),
            /*
             *  Password Input Field
             */
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 20.0),
            /*
             *  Confirm Password Input Field
             */
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Confirmar Senha",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 30.0),
            /*
             *  Register User Button
             */
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.white,
                minimumSize: Size(400, 50), textStyle: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {},
              child: Text("Cadastrar Conta"),
            ),
          ],
        ),
      ),
    );
  }
}