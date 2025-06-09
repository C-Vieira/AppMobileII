import 'package:app_mobile2/controller/book_controller.dart';
import 'package:app_mobile2/controller/book_loan_controller.dart';
import 'package:app_mobile2/controller/user_controller.dart';
import 'package:app_mobile2/model/book_loan_model.dart';
import 'package:app_mobile2/view/components/time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SearchBookView extends StatefulWidget {
  const SearchBookView({super.key});

  @override
  State<SearchBookView> createState() => _SearchBookViewState();
}

class _SearchBookViewState extends State<SearchBookView> {
  final ctrl = GetIt.I.get<BookController>();
  final userCtrl = GetIt.I.get<UserController>();
  final loanCtrl = GetIt.I.get<BookLoanController>();

  final TextEditingController searchCtrl = TextEditingController();
  String searchResult = '';

  List<String> orderCriteria = <String>['title', 'subtitle', 'category', 'registerDate'];
  String selectedCriteria = 'title';

  @override
  void initState(){
    super.initState();
    ctrl.addListener(() => setState(() {}));
    userCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       *  AppBar
       */
      appBar: AppBar(
        title: Text("Pesquisar Livros", style: TextStyle(color: Colors.white)),
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
            SearchBar(
              leading: Icon(Icons.search),
              hintText: 'pesquisar',
              controller: searchCtrl,
              onChanged: (value) {
                setState(() {
                  searchResult = value;
                });
              },
            ),
            SizedBox(height: 20.0,),
            /*
             *  ListView Books
             */
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: ctrl.listBooks(selectedCriteria),
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
                          scrollDirection: Axis.vertical,
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            String id = data.docs[index].id;
                            dynamic item = data.docs[index].data();
                            if(item['title'].toLowerCase().contains(searchResult.toLowerCase())){
                              return SizedBox(
                                width: 150,
                                child: Card(
                                  child: ListTile(
                                    leading: IconButton(
                                      icon: Icon(Icons.bookmark_add),
                                      onPressed: () => addBorrowDialog(id, item['title'], item['subtitle']),
                                    ),
                                    title: Text(item['title']),
                                    subtitle: Text(item['subtitle']),
                                    trailing: IconButton(
                                      icon: Icon(Icons.delete_outline),
                                      onPressed: () => addDeleteDialog(id),
                                    ),
                                    onTap: () {
                                      ctrl.currentBookId = id;
                                      Navigator.pushNamed(context, 'editBook');
                                    },
                                  ),
                                ),
                              );
                            }else{
                              return Visibility(visible: false, child: Text('Nenhum livro encontrado'));
                            }
                          },
                        );
                      } 
                    return Center(child: Text('Nenhum livro encontrado'));
                  }
                }
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
          addOrderByDialog();
        },
        child: Icon(Icons.list, color: Colors.blue.shade800,),
      ),
    );
  }

  void addOrderByDialog(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Ordenar por:"),
          actions: [
            DropdownButton<String>(
              value: selectedCriteria,
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: (String? value) {
                selectedCriteria = value!;
                setState(() {
                  selectedCriteria = value;
                });
              },
              items:
                orderCriteria.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
            
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

  void addBorrowDialog(bookId, bookTitle, bookSubtiltle){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Emprestar este livro?"),
          actions: [
            TextButton(
              onPressed: () {
                loanCtrl.addLoan(context, BookLoan(userCtrl.getCurrentUserId(), bookId, bookTitle, bookSubtiltle, getNow()));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Empréstimo criado com sucesso!"))
                );
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

  void addDeleteDialog(id){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Excluir este livro?"),
          actions: [
            TextButton(
              onPressed: () {
                ctrl.removeBook(context, id);
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