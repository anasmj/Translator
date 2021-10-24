import 'package:flutter/material.dart';
class AsciiMap extends StatelessWidget{
  const AsciiMap({Key? key}): super(key: key);
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Ascii Map')),
    );
  }
}