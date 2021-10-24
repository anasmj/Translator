import 'package:code_language/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code_language/providers/code_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //code will run when widget rendering complete
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final code = Provider.of<CodeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        //leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
                width: 80,
                height: 30,
                child: Text(code.isEnglish ? 'English' : 'Coded')),
            IconButton(
              icon: const Icon(
                Icons.swap_horiz,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                code.swapLanguage();
              },
            ),
            SizedBox(
                width: 80,
                height: 30,
                child: Text(code.isEnglish ? 'Coded' : 'English')),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            /// UPPER CONTAINER
            child: Container(
              height: screenHeight * 0.40,
              color: Colors.white,
              child: const UpperTextField(),

            ),
          ),
          ///2ND CONTAINER
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: screenHeight * 0.42,
              color: Colors.white,
              child:  BottomTextField(),
            ),
          ),
        ],
      ),
    );
  }
}
