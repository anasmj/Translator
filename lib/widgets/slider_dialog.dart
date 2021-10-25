import 'package:code_language/providers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:code_language/widgets/interval_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SliderDialog extends StatefulWidget {
  const SliderDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SliderDialogState();
}

class SliderDialogState extends State<SliderDialog> {
  //int intervalValue = 5;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text(
            Provider.of<CodeProvider>(context).interval.toString(),
             //intervalValue.toString(),
            style: const TextStyle(fontSize: 42),
          ),
          const SizedBox(
            height: 10,
          ),
          const IntervalSlider(),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        Builder(
          builder: (context) {
            return TextButton(
              child: const Text('Set'),
              onPressed: () {
                Provider.of<CodeProvider>(context, listen: false)
                    .setInterval(IntervalSliderState.sliderInterval);
                Navigator.of(context).pop();
                toast('value set to ${IntervalSliderState.sliderInterval.toInt()}');
              },
            );
          }
        ),
      ],
    );
  }
  void toast(String message)=> Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.white,
    textColor: Colors.black,
  );

}
