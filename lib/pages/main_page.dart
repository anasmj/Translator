import 'package:code_language/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:code_language/providers/code_provider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController startTextController = TextEditingController();
  TextEditingController targetTextController = TextEditingController();

  ScrollController _startScrollController = ScrollController();
  ScrollController _targetScrollController = ScrollController();

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
        centerTitle: true,
        ///APP BAR
        title: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
                width: 80,
                height: 30,
                child: Text(code.toEncode ? 'English' : 'Coded')),
            IconButton(
              icon: const Icon(
                Icons.swap_horiz,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () async {
                swapLanguage();
              },
            ),
            SizedBox(
                width: 80,
                height: 30,
                child: Text(code.toEncode ? 'Coded' : 'English')),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0 ),
            /// UPPER CONTAINER
            child: Container(
              height: screenHeight * 0.40,
              color: Colors.white,
              //child: getUpperTextField(),
              child: Stack(
                children: [
                  getUpperTextField(),
                  Align(
                    alignment: Alignment.centerRight,
                      child: startTextController.text.isEmpty ?  iconColumnWithoutText():  iconColumnWithText(),
                  ),
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
              child: Stack(
                children: [
                  SingleChildScrollView(child: getBottomTextField()),
                  Align(
                    alignment: Alignment.centerRight,
                    child: targetTextController.text.isEmpty ? Container(width: 0,): iconColumnForResult(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getUpperTextField(){
    return Scrollbar(
      controller: _startScrollController ,
      child: TextFormField(
        controller: startTextController,
        onChanged: (value) {
          setState(() {});//brings icon
        },
        style: const TextStyle(
          fontSize: 22,
        ),
        maxLines: 200,
        cursorColor: Colors.blue,
        cursorHeight: 30,
        decoration:  const InputDecoration(
          contentPadding: EdgeInsets.only(left: 10,right: 32),
          border: InputBorder.none,
          hintText: "Text",
          //filled: true,
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
  Widget getBottomTextField (){
    TextEditingController targetTextController = TextEditingController();
    final code = Provider.of<CodeProvider>(context);
    targetTextController.text = code.targetText.isNotEmpty? code.targetText: '';

    return Scrollbar(
      controller: _targetScrollController,
      child:  TextFormField(
        controller: targetTextController,
        enabled: false,
        style:   const TextStyle(
          fontSize: 22,
        ),
        maxLines: 100, //TODO: fix the height
        cursorColor: Colors.blue,
        cursorHeight: 30,
        decoration:  const InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, right: 32),
          border: InputBorder.none,
          //filled: true,
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );

  }

  Widget iconColumnWithoutText(){
    final code = Provider.of<CodeProvider>(context);
    return Column(
      children: [
        IconButton(
          onPressed: ()async {
            final value = await FlutterClipboard.paste();
            startTextController.text = value;
            startTextController.selection = TextSelection.fromPosition(TextPosition(offset: startTextController.text.length));

            await code.convert(startTextController.text);
            targetTextController.text = code.targetText;
            FocusScope.of(context).unfocus(); //removes keyboard after pressing enter
          },
          icon: const Icon(Icons.paste_rounded),
        ),
        IconButton(
          onPressed: () {
            toast('voice is not activated now');
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
            targetTextController.clear();
          },
          icon: const Icon(
            Icons.cancel,
          ),
          iconSize: 30,
        ),
        IconButton(
            onPressed: () {
              toast('voice is not activated now');
            },
            icon: const Icon(
              Icons.keyboard_voice,
            ),
            iconSize: 30),
        IconButton(
          onPressed:() async {
            startTextController.text = startTextController.text.isEmpty ? await FlutterClipboard.paste() : startTextController.text + await FlutterClipboard.paste();
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
          onPressed: ()async {
            await code.convert(startTextController.text);
            targetTextController.text = code.targetText;
            FocusScope.of(context).unfocus(); //removes keyboard after pressing enter
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
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: () async {
                await FlutterClipboard.copy(targetTextController.text);
                toast('copied');
              },
              icon: const Icon(Icons.copy_outlined),
            );
          }
        ),
        IconButton(
          onPressed: () {
            Share.share(targetTextController.text.toString());
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
    backgroundColor: Colors.grey,
    textColor: Colors.black,
  );
  void swapLanguage () async{
    //final code = Provider.of<CodeProvider>(context); this line doesn't work
    final code = Provider.of<CodeProvider>(context,listen: false);
    code.swap();
    String start = startTextController.text;
    String target = targetTextController.text;

    await code.convert(target);
    targetTextController.text = code.targetText;
    startTextController.text = start;
    //startTextController.clear();

  }
}
