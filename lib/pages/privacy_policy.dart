import 'package:flutter/material.dart';
class PrivacyPolicy extends StatelessWidget{
  const PrivacyPolicy({Key? key}): super(key: key);
  @override
  Widget build (BuildContext context){
    return WillPopScope(
      onWillPop: (){
        Navigator.popAndPushNamed(context, '/main_page');
        throw 'error in setting page';
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Privacy Policy')),
        body: const Center(child: Text('There are no privacy policy at the moment ')),
      ),
    );
  }
}