import 'package:app_mobile2/controller/book_controller.dart';
import 'package:app_mobile2/controller/book_loan_controller.dart';
import 'package:app_mobile2/controller/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final loanCtrl = GetIt.I.get<BookLoanController>();

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
              child: StreamBuilder<QuerySnapshot>(
                stream: BookLoanController().listLoans(),
                builder: (context, snapshot) {
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      return Center(
                        child: Text('Não foi possível conectar'),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      final data = snapshot.requireData;
                      if(data.size > 0){
                        return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            String id = data.docs[index].id;
                            dynamic item = data.docs[index].data();
                            return SizedBox(
                              width: 150,
                              child: Card(
                                child: ListTile(
                                  leading: Icon(Icons.auto_stories),
                                  // TODO: Get book data from bookUid and display
                                  title: Text(item['userUid']),
                                  subtitle: Text(item['bookUid']),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete_outline),
                                    onPressed: () => addDeleteDialog(id),
                                  ),
                                  onTap: () {
                                    //ctrl.currentBookIndex = ctrl.books.indexOf(loan.book);
                                    Navigator.pushNamed(context, 'bookDetails');
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }
                    return Center(child: Text('Nenhum empréstimo encontrado'));
                  }
                },
              )
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

  void addDeleteDialog(id){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Excluir este livro?"),
          actions: [
            TextButton(
              onPressed: () {
                loanCtrl.removeLoan(context, id);
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