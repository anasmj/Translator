import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _fullStopCheck = false;
  bool _spaceBarCheck = false;
  bool _commaCheck = false;
  bool _otherSpecialCharacterCheck = false;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ListTile(
              title: Text('Choose ASCII Interval',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle:Text('The number you want to add/substruct with your text'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            CheckboxListTile(
              title: const Text('Convert full Stop'),
              controlAffinity: ListTileControlAffinity.trailing,
              value: _fullStopCheck,
              onChanged: (bool? value) {
                setState(() {
                    _fullStopCheck = value!;
                });
                print('value');
              },
              // activeColor:
              // checkColor:,
            ),
            CheckboxListTile(
              title: const Text('Convert space bar'),
              controlAffinity: ListTileControlAffinity.trailing,
              value: _spaceBarCheck,
              onChanged: (bool? value) {
                setState(() {
                  _spaceBarCheck = value!;
                });
                print('value');
              },
            ),
            CheckboxListTile(
              title: const Text('Convert comma'),
              controlAffinity: ListTileControlAffinity.trailing,
              value: _commaCheck,
              onChanged: (bool? value) {
                setState(() {
                  _commaCheck = value!;
                });
                print('value');
              },
            ),
            CheckboxListTile(
              title: const Text('Convert other special characters'),
              controlAffinity: ListTileControlAffinity.trailing,
              value: _otherSpecialCharacterCheck,
              onChanged: (bool? value) {
                print('check');
                setState(() {
                  _otherSpecialCharacterCheck = value!;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}