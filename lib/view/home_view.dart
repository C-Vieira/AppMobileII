import 'package:app_mobile2/controller/book_controller.dart';
import 'package:app_mobile2/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ctrl = GetIt.I.get<BookController>();
  final userCtrl = GetIt.I.get<UserController>();

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
        title: Text("Home: Bem Vindo ${userCtrl.users[userCtrl.currentUserIndex].name} !", style: TextStyle(color: Colors.white)),
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
            Text("Meus Empréstimos: ", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20.0,),
            /*
             *  ListView Empréstimos
             */
            /*Expanded(
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
                      ),
                    ),
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
      /*
       *  Floating Action Button
       */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'operations');
        },
        child: Icon(Icons.folder, color: Colors.blue.shade800,),
      ),
    );
  }
}