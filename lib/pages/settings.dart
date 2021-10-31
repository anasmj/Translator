import 'package:code_language/providers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:code_language/widgets/slider_dialog.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget{
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build (BuildContext context){
    final code = Provider.of<CodeProvider>(context,listen: false);

    return WillPopScope(
      onWillPop: () {
        //Navigator.pushReplacementNamed(context, '/settings');
        Navigator.popAndPushNamed(context, '/main_page');
        throw 'error in setting page';
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               ListTile(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_) => const SliderDialog(),
                  );
                },
                title: const Text('Choose ASCII Interval',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                subtitle:const Text('The number you want to add/substruct with your text',style: TextStyle(fontSize:15 ),),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              CheckboxListTile(
                title: getTitle('Include full Stop'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: code.includePoint,
                onChanged: (bool? value) {
                  setState(() {
                    code.includePoint = value!;
                    // _fullStopCheck = value!;
                      // code.includePoint = _fullStopCheck;
                  });
                },
                // activeColor:
                // checkColor:,
              ),
              CheckboxListTile(
                title: getTitle('Include space bar'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: code.includeSpace,
                onChanged: (bool? value) {
                  setState(() {
                    code.includeSpace = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: getTitle('Include comma'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: code.includeComma,
                onChanged: (bool? value) {
                  setState(() {
                    code.includeComma = value!;
                  });
                },
              ),
              //getOtherCharacterCheckbox('Include other characters', _otherSpecialCharacterCheck),
              CheckboxListTile(
                title: getTitle('Include other special characters'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: code.includeSpecialCharacters,
                onChanged: (bool? value) {
                  setState(() {
                    code.includeSpecialCharacters = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget getTitle(String value){
    return Text(
      value,
      style: const TextStyle(fontSize: 18),
    );
  }
}