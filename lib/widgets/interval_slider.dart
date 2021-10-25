import 'package:code_language/providers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntervalSlider extends StatefulWidget{
  const IntervalSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => IntervalSliderState();
}
class IntervalSliderState extends State<IntervalSlider>{
  static double sliderInterval = 5;
  //double get sliderInterval => _sliderInterval;
  @override
  Widget build (BuildContext context){
    return Slider(
      value: sliderInterval,
      min: -20,
      max: 20,
      divisions: 100,
      onChanged: (value) => setState((){
        sliderInterval = value;
      }),
      label: sliderInterval.round().toString() ,
    );
  }
}
