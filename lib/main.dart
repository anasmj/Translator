import 'package:code_language/pages/about_ascii.dart';
import 'package:code_language/pages/ascii_table.dart';
import 'package:code_language/pages/privacy_policy.dart';
import 'package:code_language/pages/rate.dart';
import 'package:code_language/pages/settings.dart';
import 'package:code_language/providers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:code_language/pages/main_page.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CodeProvider())
      ],
    child:  const Coder(),
  ));
}

class Coder extends StatelessWidget{
  const Coder({Key? key}) : super(key: key);
  final Color appColor = const Color(0xff3764b3);
  @override
  Widget build( BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffe1e3e8),
        primaryColor: appColor,
        appBarTheme: const AppBarTheme().copyWith(
          color: appColor,
        ),
        iconTheme: IconThemeData(
            color: appColor,
        ),
      ),

      debugShowCheckedModeBanner: false,
      //home: MainPage(),
      initialRoute: '/main_page',
      routes: {
        '/main_page': (context) => const MainPage(),
        '/settings': (context) => const Settings(),
        //'/ascii_table': (context) => const AsciiTable(),
        '/rate': (context) => const Rate(),
        '/privacy_policy': (context) => const PrivacyPolicy(),
        '/about_ascii': (context) => const AboutAscii(),
      },
    );
  }
}