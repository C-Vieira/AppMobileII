import 'package:intl/intl.dart';

String getNow(){
  var now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');

  return formatter.format(now);
}