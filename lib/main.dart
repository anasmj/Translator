import 'package:flutter/material.dart';
import 'package:code_language/pages/main_page.dart';

void main(){
  runApp(Coder());
}
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