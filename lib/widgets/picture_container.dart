import 'package:flutter/material.dart';

class PictureContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:
      EdgeInsets.only(top: screenHeight * 0.07, left: screenHeight * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            width: 50,
            height: 50,
            child: Image(image: AssetImage('assets/code.png'),
              fit: BoxFit.fill,
            ),

          ),
          Padding(
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
          Text(
            'Talha Ash Sharke',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
