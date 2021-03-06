import 'package:code_language/providers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:code_language/widgets/picture_container.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  final double settingFontSize = 16;

  @override
  Widget build(BuildContext context) {
    final code = Provider.of<CodeProvider>(context,listen: false);

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                 gradient: LinearGradient(
                   colors: [ Color(0xff3764b3) , Color(0xfd93764b3)],
                 ),
                ),
                //color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: 160,
              ),
              PictureContainer(),
            ],
          ),
           ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/settings");
              code.clearProviderTexts();
            },
            leading: const Icon(Icons.settings,),
            title: const Text(
              'Settings',style: TextStyle(fontSize: 16),
            ),
          ),
          //  ListTile(
          //   onTap: (){
          //     Navigator.pushNamed(context, "/ascii_table");
          //   },
          //   leading: const Icon(Icons.map),
          //   title: const Text('ASCII table',style: TextStyle(fontSize: 16),),
          // ),
           ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/rate");
            },
            leading: const Icon(Icons.favorite),
            title: const Text('Rate',style: TextStyle(fontSize: 16),),
          ),
           ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/about_ascii");
            },
            leading: const Icon(Icons.description),
            title: const Text('About ASCII',style: TextStyle(fontSize: 16),),
          ),
           ListTile(
             onTap: (){
               Navigator.pushNamed(context, "/privacy_policy");
             },
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy',style: TextStyle(fontSize: 16),),
          ),
          ListTile(
            onTap: (){
              callDeveloper();
            },
            leading: const Icon(Icons.face_rounded),
            title: const Text('Inform an issue',style: TextStyle(fontSize: 16),),
          ),
        ],
      ),
    );
  }
  Future callDeveloper() async {
    const String number = '+8801627862143';
    await launch('tel:$number');
  }
}