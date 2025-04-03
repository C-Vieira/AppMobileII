import 'package:app_mobile2/controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListBookView extends StatefulWidget {
  const ListBookView({super.key});

  @override
  State<ListBookView> createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> {
  final ctrl = GetIt.I.get<BookController>();

  @override
  void initState(){
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

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
            Text("Livros Disponíveis: ", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20.0,),
            /*
             *  ListView Books
             */
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: ctrl.books.length,
                itemBuilder: (context, index) {
                  final book = ctrl.books[index];
                  return SizedBox(
                    width: 150,
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.auto_stories),
                        title: Text(book.title),
                        subtitle: Text(book.subtitle),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () => ctrl.removeBook(index),
                        ),
                        onTap: () {
                          ctrl.currentBookIndex = index;
                          Navigator.pushNamed(context, 'bookDetails');
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}