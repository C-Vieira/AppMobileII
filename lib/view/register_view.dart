import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

        child: Form(
          key: _formKey,         

          child: Column(
            children: [
              SizedBox(height: 30.0),
              /*
              *  Name Input Field
              */
              TextFormField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Informe seu Nome";
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 20.0),
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
              *  Phone Number Input Field
              */
              TextFormField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Telefone",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Informe seu Telefone";
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 20.0),
              /*
              *  Password Input Field
              */
              TextFormField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Defina sua Senha";
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 20.0),
              /*
              *  Confirm Password Input Field
              */
              TextFormField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Confirmar Senha",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Confirme sua Senha";
                  }
                  return null;
                },
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
                onPressed: () {
                  if(_formKey.currentState!.validate()){

                  }
                },
                child: Text("Cadastrar Conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}