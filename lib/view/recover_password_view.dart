import 'package:flutter/material.dart';

class RecoverPasswordView extends StatefulWidget {
  const RecoverPasswordView({super.key});

  @override
  State<RecoverPasswordView> createState() => _RecoverPasswordView();
}

class _RecoverPasswordView extends State<RecoverPasswordView> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              SizedBox(height: 30.0),
              /*
              *  Email Input Field
              */
              TextFormField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Informe seu Email";
                  }
                  return null;
                },
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
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    
                  }
                },
                child: Text("Recuperar Senha"),
              ),
            ],
          )
        )
      ),
    );
  }
}