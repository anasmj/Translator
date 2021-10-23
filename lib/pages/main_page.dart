import 'package:code_language/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        //leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('Decode'),
            IconButton(
              icon: Icon(
                Icons.swap_horiz,
                size: 30,
                color: Colors.white,
              ),
              onPressed: null,
            ),
            Text('Encode'),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),

            /// UPPER CONTAINER
            child: Container(
              height: screenHeight * 0.40,
              color: Colors.white,
              child: Row(
                children: const [
                  Flexible(child: upperTextField()),
                  iconColumnWithoutText(),
                ],
              ),
            ),
          ),

          ///2ND CONTAINER
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: screenHeight * 0.42,
              color: Colors.white,
              child: Row(
                children: const [
                  Flexible(child: bottomTextField()),
                  iconColumforResult(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
