import 'package:flutter/cupertino.dart';
import 'package:code_language/model/text_object.dart';

class CodeProvider with ChangeNotifier {

  String _startText = ' ';
  String _targetText = ' ';
  int _value = 1;
  final bool _includePoint = false;
  final bool _includeSpace=false;
  final bool _includeComma =false;
  final bool _includeSpecialCharacters = false;
  bool _toEncode = true;
  //bool _activeTextField = false;
  bool get isEnglish => _toEncode;
  bool _isClear = false;

  //bool get activeTextField => _activeTextField;
  String get targetText => _targetText;
  int get value => value;

  bool get isClear => _isClear;
  set targetText(String value) {
    _targetText = value;
  }
  set isClear(bool value) {
    _isClear = value;
  }
  set startText(String value){
    _startText = value;
  }

  void setValue (double value){
    _value = value.toInt();
  }
  void clearText(){
    _startText = '';
    _targetText ='';
    _isClear = true;
    notifyListeners();
  }
  // void activateTextField(){
  //   _activeTextField = true;
  //   notifyListeners();
  // }
  // void deactivateTextField(){
  //   _activeTextField = false;
  //   notifyListeners();
  // }
  void swapLanguage(){
    _toEncode = !_toEncode;
    notifyListeners();
  }

  Future<void> convert (String text)async {
    TextObject textObj = TextObject(startText: text, value: _value, toEncode: _toEncode, includePoint: _includePoint, includeSpace: _includeSpace, includeComma: _includeComma,includeSpcialCharacters: _includeSpecialCharacters );
    targetText = textObj.convertText();
    notifyListeners();
  }
}