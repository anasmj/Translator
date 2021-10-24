import 'package:code_language/providers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: 160,
              ),
              PictureContainer(),
            ],
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'), //-> text size, ascii interval
          ),
          const ListTile(
            leading: Icon(Icons.map),
            title: Text('ASCII Map'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Rate'),
          ),
          const ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text('Privacy Policy'),
          ),
        ],
      ),
    );
  }
}

class PictureContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:
          EdgeInsets.only(top: screenHeight * 0.07, left: screenHeight * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.orange,
            width: 50,
            height: 50,
            child: Text('PIC'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 4),
            child: Text(
              'ASCII Encoder Decoder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'Talha Ash Sharke',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class UpperTextField extends StatefulWidget {
  const UpperTextField({Key? key}) : super(key: key);
  @override
  State<UpperTextField> createState() => UpperTextFieldState();
}

class UpperTextFieldState extends State<UpperTextField> {
  TextEditingController startTextController = TextEditingController();
  TextEditingController targetTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final code = Provider.of<CodeProvider>(context);
    //code.startText = startTextController.text;
    // if(code.startText.isEmpty) => setState((){startTextController.text = ''});
    if(code.isClear){
      startTextController.clear();
      code.isClear = false;
    }
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
  Widget iconColumnWithoutText(){
    return Column(
      children: [
        IconButton(
          onPressed: () {
            print('paste ');
          },
          icon: const Icon(Icons.paste_rounded),
        ),
        IconButton(
          onPressed: () {
            print('voice ');
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
          },
          icon: const Icon(
            Icons.cancel,
          ),
          iconSize: 30,
        ),
        IconButton(
            onPressed: () {
              print('voice');
            },
            icon: const Icon(
              Icons.keyboard_voice,
            ),
            iconSize: 30),
        IconButton(
          onPressed:() {
            print('paste');
          },
          icon: const Icon(Icons.paste_rounded),
        ),
        IconButton(
          onPressed: () {
            print('copy');
          },
          icon: const Icon(
            Icons.copy_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            print('enter');
            code.targetText = startTextController.text;
          },
          icon: const Icon(
            Icons.subdirectory_arrow_left,
          ),
        ),
      ],
    );
  }
}

class BottomTextField extends StatefulWidget {
  BottomTextField({Key? key}) : super(key: key);
  @override
  State<BottomTextField> createState() => _BottomTextFieldState();
}

class _BottomTextFieldState extends State<BottomTextField> {
  TextEditingController targetTextController = TextEditingController();
  //TODO fix : build function running only when keyboard is minimized
  // result is not getting in real time
  @override
  Widget build(BuildContext context) {
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
        //TODO fix target text controller and it's icons
        suffixIcon: targetTextController.text.isEmpty ? Container(width: 0,): iconColumnForResult(),
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        border: InputBorder.none,
        //filled: true,
        hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );
  }

  Widget iconColumnForResult(){
    return Column(
      children:  [
        IconButton(
          onPressed: () {
            print('copy');
          },
          icon: const Icon(Icons.copy_outlined),
        ),
        IconButton(
          onPressed: () {
            print('share');
          },
          icon: const Icon(
            Icons.share,
          ),
          iconSize: 25,
        ),
      ],
    );
  }
}
