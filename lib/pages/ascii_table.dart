import 'package:flutter/material.dart';
class AsciiTable extends StatelessWidget{
  const AsciiTable({Key? key}): super(key: key);
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Ascii Table')),
      body: const Image(image: AssetImage('assets/ascii.png'),),
    );
  }
}