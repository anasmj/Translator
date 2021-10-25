import 'package:code_language/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:code_language/providers/code_provider.dart';
import 'package:clipboard/clipboard.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController startTextController = TextEditingController();
  TextEditingController targetTextController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //code will run when widget rendering complete
    });
    super.initState();
  }
  @override
  Widget build (BuildContext context) {
    final code = Provider.of<CodeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        //leading: const Icon(Icons.menu),
        centerTitle: true,
        ///APP BAR
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
              child: getUpperTextField(),
            ),
          ),
          ///2ND CONTAINER
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: screenHeight * 0.42,
              color: Colors.white,
              child:  getBottomTextField(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getUpperTextField(){
    final code = Provider.of<CodeProvider>(context);

    return TextFormField(
      controller: startTextController,
      onChanged: (value) {
        value.isNotEmpty ? code.activateTextField() : code.deactivateTextField();
      },
      style: const TextStyle(
        fontSize: 22,
      ),
      maxLines: 16,
      cursorColor: Colors.blue,
      cursorHeight: 30,
      decoration:  InputDecoration(
        suffixIcon: startTextController.text.isEmpty ?  iconColumnWithoutText():  iconColumnWithText(),
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        border: InputBorder.none,
        hintText: "Text",
        //filled: true,
        hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );
  }
  Widget getBottomTextField (){

    TextEditingController targetTextController = TextEditingController();
    final code = Provider.of<CodeProvider>(context);
    targetTextController.text = code.targetText.isNotEmpty? code.targetText: '';

    return TextFormField(
      controller: targetTextController,
      enabled: false,
      style: const TextStyle(
        fontSize: 22,
      ),
      maxLines: 16,
      cursorColor: Colors.blue,
      cursorHeight: 30,
      decoration:  InputDecoration(
        suffixIcon: targetTextController.text.isEmpty ? Container(width: 0,): iconColumnForResult(),
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        border: InputBorder.none,
        //filled: true,
        hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );

  }

  Widget iconColumnWithoutText(){
    return Column(
      children: [
        IconButton(
          onPressed: ()async {
            final value = await FlutterClipboard.paste();
            //startTextController.selection = TextSelection.fromPosition(TextPosition(offset: startTextController.text.length));

            startTextController.text = value;
          },
          icon: const Icon(Icons.paste_rounded),
        ),
        IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.keyboard_voice,
          ),
          iconSize: 30,
        ),
      ],
    );
  }
  Widget iconColumnWithText(){
    final code = Provider.of<CodeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            code.clearText();
            startTextController.clear();
          },
          icon: const Icon(
            Icons.cancel,
          ),
          iconSize: 30,
        ),
        IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.keyboard_voice,
            ),
            iconSize: 30),
        IconButton(
          onPressed:() async {
            //TODO fix bug on paste
            final value = await FlutterClipboard.paste();
            startTextController.text = value;
          },
          icon: const Icon(Icons.paste_rounded),
        ),
        Builder(
          builder: (context) =>IconButton(
            onPressed: () async {
              await FlutterClipboard.copy(startTextController.text);
              toast('copied');
            },
            icon: const Icon(
              Icons.copy_outlined,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            code.targetText = startTextController.text;
            targetTextController.text = startTextController.text;
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(
            Icons.subdirectory_arrow_left,
          ),
        ),
      ],
    );
  }
  Widget iconColumnForResult(){
    return Column(
      children:  [
        IconButton(
          onPressed: () {
          },
          icon: const Icon(Icons.copy_outlined),
        ),
        IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.share,
          ),
          iconSize: 25,
        ),
      ],
    );
  }

  void toast(String message)=> Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.white,
    textColor: Colors.black,
  );
}
