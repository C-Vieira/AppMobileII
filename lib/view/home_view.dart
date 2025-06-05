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
    userCtrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text('Bem Vindo!', style: TextStyle(color: Colors.white),)),
            FutureBuilder<String>(
              future: UserController().getCurrentUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                 return Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        UserController().logout();
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      icon: Icon(Icons.exit_to_app, size: 20, color: Colors.white,),
                      label: Text(snapshot.data.toString()),
                    ),
                  );
                }
                return Text('');
              },
            )
          ],
        ),
        //centerTitle: true,
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
             *  ListView BookLoan
             */
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: userCtrl.users[userCtrl.currentUserIndex].loans.length,
                itemBuilder: (context, index) {
                  if(index < userCtrl.users[userCtrl.currentUserIndex].loans.length){
                    final loan = userCtrl.users[userCtrl.currentUserIndex].loans[index];
                    if(false /*ctrl.books.contains(loan.book)*/){
                      return SizedBox(
                        width: 150,
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.auto_stories),
                            title: Text(loan.book.title),
                            subtitle: Text(loan.book.subtitle),
                            trailing: IconButton(
                              icon: Icon(Icons.delete_outline),
                              onPressed: () => addDeleteDialog(index),
                            ),
                            onTap: () {
                              //ctrl.currentBookIndex = ctrl.books.indexOf(loan.book);
                              Navigator.pushNamed(context, 'bookDetails');
                            },
                          ),
                        ),
                      );
                    }else{
                      userCtrl.removeLoan(index, userCtrl.currentUserIndex);
                      return null;
                    }
                  }else{
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
      /*
       *  Floating Action Button
       */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'viewBooks');
        },
        child: Icon(Icons.folder, color: Colors.blue.shade800,),
      ),
    );
  }

  void addDeleteDialog(int index){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Excluir este livro?"),
          actions: [
            TextButton(
              onPressed: () {
                userCtrl.removeLoan(index, userCtrl.currentUserIndex);
                Navigator.pop(context);
              },
              child: Text("Sim", style: TextStyle(fontSize: 18.0),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar", style: TextStyle(fontSize: 18.0),),
            )
          ],
        );
      }
    );
  }
}