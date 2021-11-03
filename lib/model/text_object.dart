import 'dart:convert';
class TextObject{

  String startText;
  int value;
  bool toEncode, includePoint,includeSpace,includeComma,includeSpecialCharacters;

  String? targetText;
  TextObject({
    required this.toEncode,
    required this.startText,
    required this.value,
    required this.includePoint,
    required this.includeSpace,
    required this.includeComma,
    required this.includeSpecialCharacters,
  });
  String convertText (){
    var toAscii = ascii.encode(startText); //toascii = 46
    var targetList = toAscii;
    String target = '';
    List<int> specialCharacters = [33,34,35,36,37,38,39,40,41,42,43,45,47,58,59,60,61,62,63,64,91,92,93,94,95,96,173,174,175,176];

    if(toEncode){

      for (int i = 0 ; i< toAscii.length; i++){
        if(targetList.any((item) => specialCharacters.contains(item)) && !includeSpecialCharacters){// by default special characters will not be converted
          targetList [i] = targetList [i]- value;

        }
        if(targetList [i]==46 && !includePoint){ //full stop -46
          targetList [i] = targetList [i]- value;
        }
        if(targetList [i]==32 && !includeSpace){//fspace-32
          targetList [i] = targetList [i]- value;
        }
        if(targetList [i]==44 && !includeComma){//comma -44
          targetList [i] = targetList [i]- value;
        }
        targetList [i] = targetList[i] + value;
      }
    }
    else{
      for (int i = 0 ; i< toAscii.length; i++){
        if(targetList.any((item) => specialCharacters.contains(item)) && !includeSpecialCharacters){// by default special characters will not be converted
          targetList [i] = targetList [i]+ value;
        }
        if(targetList [i]==46 && !includePoint){ //full stop -46
          targetList [i] = targetList [i]+ value;
        }
        if(targetList [i]==32 && !includeSpace){//fspace-32
          targetList [i] = targetList [i]+ value;
        }
        if(targetList [i]==44 && !includeComma){//comma -44
          targetList [i] = targetList [i]+ value;
        }
        targetList [i] = targetList[i] - value;
      }
    }

    List<int> intList = targetList.cast<int>();//dynamic to int
    target = target+ ascii.decode(intList);

    return target;
  }

}
