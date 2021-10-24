import 'package:flutter/material.dart';

class PictureContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:
      EdgeInsets.only(top: screenHeight * 0.07, left: screenHeight * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.orange,
            width: 50,
            height: 50,
            child: Text('PIC'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 4),
            child: Text(
              'ASCII Encoder Decoder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'Talha Ash Sharke',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
