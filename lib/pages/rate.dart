import 'package:flutter/material.dart';
class Rate extends StatelessWidget{
  const Rate({Key? key}): super(key: key);
  @override
  Widget build (BuildContext context){
    return WillPopScope(
      onWillPop: (){
        Navigator.popAndPushNamed(context, '/main_page');
        throw 'error in setting page';
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Rate')),
        body : const Center(child: Text('Rating is not available at the moment')),
      ),
    );
  }
}