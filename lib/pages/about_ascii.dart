import 'package:flutter/material.dart';
class AboutAscii extends StatelessWidget{
  const AboutAscii({Key? key}): super(key: key);
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('About Ascii')),
    );
  }
}