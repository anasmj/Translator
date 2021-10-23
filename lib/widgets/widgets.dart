import 'package:flutter/material.dart';

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
class PictureContainer extends StatelessWidget{
  Widget build( BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: screenHeight*0.07,left: screenHeight*0.02),
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
          const Text('Talha Ash Sharke', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}

class upperTextField extends StatefulWidget {
  const upperTextField({Key? key}) : super(key: key);

  @override
  State<upperTextField> createState() => _upperTextFieldState();
}

class _upperTextFieldState extends State<upperTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 22,
      ),
      maxLines: 16,
      cursorColor: Colors.blue,
      cursorHeight: 30,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(top: 10, left: 8),
        border: InputBorder.none,
        hintText: "Text",
        //filled: true,
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );
  }
}

class bottomTextField extends StatelessWidget {
  const bottomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      style: const TextStyle(
        fontSize: 22,
      ),
      maxLines: 16,
      cursorColor: Colors.blue,
      cursorHeight: 30,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(top: 10, left: 8),
        border: InputBorder.none,
        //filled: true,
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );
  }
}

class iconColumnWithText extends StatelessWidget {
  const iconColumnWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.cancel,
          ),
          iconSize: 30,
        ),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.keyboard_voice,
            ),
            iconSize: 30),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.paste_rounded),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.copy_outlined,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.subdirectory_arrow_left,
          ),
        ),
      ],
    );
  }
}

class iconColumnWithoutText extends StatelessWidget {
  const iconColumnWithoutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.paste_rounded),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.keyboard_voice,
          ),
          iconSize: 30,
        ),
      ],
    );
  }
}

class iconColumforResult extends StatelessWidget {
  const iconColumforResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.copy_outlined),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.share,
          ),
          iconSize: 25,
        ),
      ],
    );
  }
}
