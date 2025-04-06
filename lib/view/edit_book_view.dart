import 'package:app_mobile2/controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class EditBookView extends StatefulWidget {
  const EditBookView({super.key});

  @override
  State<EditBookView> createState() => _EditBookViewState();
}

class _EditBookViewState extends State<EditBookView> {
  final ctrl = GetIt.I.get<BookController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String title = "";
  String subtitle = "";
  int borrowTime = 0;
  String descripton = "";

  @override
  Widget build(BuildContext context) {
    title = ctrl.books[ctrl.currentBookIndex].title;
    subtitle = ctrl.books[ctrl.currentBookIndex].subtitle;
    borrowTime = ctrl.books[ctrl.currentBookIndex].borrowTime;
    descripton = ctrl.books[ctrl.currentBookIndex].descripton;  

    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Editar Livro", style: TextStyle(color: Colors.white)),
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
                *  Title Input Field
                */
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  initialValue: ctrl.books[ctrl.currentBookIndex].title,
                  decoration: InputDecoration(
                    labelText: "Título",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Informe o Título";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 20.0),
                /*
                *  Subtitle Input Field
                */
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  initialValue: ctrl.books[ctrl.currentBookIndex].subtitle,
                  decoration: InputDecoration(
                    labelText: "Subtítulo",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Informe o Subtítulo";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    subtitle = value;
                  },
                ),
                SizedBox(height: 20.0),
                /*
                *  Borrow Time(Days) Input Field
                */
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  initialValue: ctrl.books[ctrl.currentBookIndex].borrowTime.toString(),
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: "Tempo de Empréstimo (Dias)",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Informe o Tempo de Empréstimo";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    borrowTime = int.tryParse(value) ?? 0;
                  },
                ),
                SizedBox(height: 20.0),
                /*
                *  Description Input Field
                */
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  initialValue: ctrl.books[ctrl.currentBookIndex].descripton,
                  decoration: InputDecoration(
                    labelText: "Descrição (Opcional)",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onChanged: (value) {
                    descripton = value;
                  },
                ),
                SizedBox(height: 20.0),
                /*
                *  Edit Book Button
                */
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    minimumSize: Size(400, 50), textStyle: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      ctrl.editBook(title, subtitle, borrowTime, descripton);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Livro editado com sucesso!"),
                        )
                      );
                    }
                  },
                  child: Text("Editar Livro"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}