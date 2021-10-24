import 'package:flutter/cupertino.dart';

class CodeProvider with ChangeNotifier {
  bool _isEnglish = true;
  bool _activeTextField = false;
  bool get isEnglish => _isEnglish;
  bool _isClear = false;
  String _startText = ' ';
  String _targetText = ' ';



  bool get isClear => _isClear;
  bool get activeTextField => _activeTextField;
  String get targetText => _targetText;


  set targetText(String value) {
    _targetText = value;
  }
  set isClear(bool value) {
    _isClear = value;
  }
  set startText(String value){
    _startText = value;
    print('text in provider $value') ;
  }

  void clearText(){
    _startText = '';
    _targetText ='';
    _isClear = true;
    notifyListeners();
  }
  void activateTextField(){
    _activeTextField = true;
    notifyListeners();
  }
  void deactivateTextField(){
    _activeTextField = false;
    notifyListeners();
  }
  void swapLanguage(){
    _isEnglish = !_isEnglish;
    notifyListeners();
  }
}