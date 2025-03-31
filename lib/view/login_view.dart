import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Bem Vindo", style: TextStyle(color: Colors.white)),
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
            /*
             *  App Image
             */
            Image(image: AssetImage('assets/images/books.jpg'), fit: BoxFit.cover),
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
            SizedBox(height: 30.0),
            /*
             *  Login Button
             */
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.white,
                minimumSize: Size(400, 50), textStyle: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              child: Text("Fazer Login"),
            ),
            SizedBox(height: 20.0), 
            /*
             *  Register and Forgot Password Buttons
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    minimumSize: Size(100, 50), textStyle: TextStyle(fontSize: 15.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: Text("Cadastrar Conta"),
                ),
                SizedBox(width: 12.0,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    minimumSize: Size(100, 50), textStyle: TextStyle(fontSize: 15.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'recover');
                  },
                  child: Text("Recuperar Senha"),
                ),
              ],
            )
          ],
        ),
      ),
      /*
       *  Floating Action Button
       */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'about');
        },
        child: Icon(Icons.question_mark_sharp, color: Colors.blue.shade800,),
      ),
    );
  }
}