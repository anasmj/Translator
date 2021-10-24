import 'package:code_language/providers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:code_language/pages/main_page.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CodeProvider())
      ],
    child: Coder(),
  ));
}


//
// void main(){
//   runApp(Coder());
// }
class Coder extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffe1e3e8),
        //scaffoldBackgroundColor: Colors.white12,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}