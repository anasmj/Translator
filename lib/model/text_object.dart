import 'dart:convert';
class TextObject{

  String startText;
  int value;
  bool toEncode, includePoint,includeSpace,includeComma,includeSpcialCharacters;

  String targetText = '';
  TextObject({
    required this.startText,
    required this.value,
    required this.toEncode,
    required this.includePoint,
    required this.includeSpace,
    required this.includeComma,
    required this.includeSpcialCharacters,
  });
  String convertText (){

    var toAscii = ascii.encode(startText);
    var targetList = toAscii;
    String target = '';
    List<int> specialCharacters = [33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,58,59,60,61,62,63,64,91,92,93,94,95,96,173,174,175,176];

    if(toEncode){
      for (int i = 0 ; i< toAscii.length; i++){
        if(targetList [i]==46 && !includePoint){//full stop -46
          targetList [i] = targetList [i]-value;
        }
        if(targetList [i]==32 && !includeSpace){//fspace-32
          targetList [i] = targetList [i]-value;
        }
        if(targetList [i]==44 && includeComma){//comma -44
          targetList [i] = targetList [i]-value;
        }
        if(targetList.any((item) => specialCharacters.contains(item)) && includeSpcialCharacters){// by default special characters will not be converted
          //targetList [i] = targetList [i]-value;
        }
        targetList [i] = toAscii[i]+value;

        //print('$i: ${targetList[i]}');
      }
    }else{
      for (int i = 0 ; i< toAscii.length; i++){
        if(targetList [i]==46 && !includePoint){//full stop -46
          targetList [i] = targetList [i]+value;
        }
        if(targetList [i]==32 && !includeSpace){//fspace-32
          targetList [i] = targetList [i]+value;
        }
        if(targetList [i]==44 && includeComma){//comma -44
          targetList [i] = targetList [i]+value;
        }
        if(targetList.any((item) => specialCharacters.contains(item)) && includeSpcialCharacters){// by default special characters will not be converted
          //targetList [i] = targetList [i]-value;
        }
        targetList [i] = toAscii[i]-value;
      }
    }
    List<int> intList = targetList.cast<int>();//dynamic to int
    target = ascii.decode(intList);

    return target;
  }

}
