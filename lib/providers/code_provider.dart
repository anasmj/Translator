import 'package:flutter/cupertino.dart';
import 'package:code_language/model/text_object.dart';

class CodeProvider with ChangeNotifier {

  String _startText = ' ';
  set startText(String value){
    _startText = value;
  }
  String _targetText = ' ';
  String get targetText => _targetText;

  int _value = 5;
  int get value => _value;
  void setValue (double value){
    _value = value.toInt();
  }

  bool includePoint = false;
  bool includeSpace= false;
  bool includeComma = false;
  bool includeSpecialCharacters = false;


  // bool _isClear = false;
  // bool get isClear => _isClear;
  // set isClear(bool value) {
  //   _isClear = value;
  // }

  bool _toEncode = true;
  bool get toEncode => _toEncode;
  set toEncode(bool value) {
    _toEncode = value;

  }

  set targetText(String value) {
    _targetText = value;
  }

  void clearProviderTexts(){
    _startText = '';
    _targetText ='';
    //_isClear = true;
    notifyListeners();
  }

  void swap(){
    _toEncode = !_toEncode;
    notifyListeners();
  }

  Future<void> convert (String text,)async {
    try{
      TextObject textObj = TextObject(startText: text, value: _value, toEncode: _toEncode, includePoint: includePoint, includeSpace: includeSpace, includeComma: includeComma,includeSpecialCharacters: includeSpecialCharacters );
      targetText = textObj.convertText();

    }catch(e){
      targetText = 'Sorry, could not convert the text';
    }
    notifyListeners();
  }
}