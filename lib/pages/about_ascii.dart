import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAscii extends StatelessWidget {
  const AboutAscii({Key? key}) : super(key: key);
  final double myPadding = 8.0;
  final double myFontSize = 16;
  // final TapGestureRecognizer _sourceRecognizer = TapGestureRecognizer()..onTap = (){
  //   debugPrint('recodnized');
  // };

  //String aboutAscii = 'some Text';
  final String aboutAscii =
      'The full form of ASCII is the American Standard Code for information interchange';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('About Ascii')),
        body: Padding(
          padding:  EdgeInsets.all(myPadding),
          child: ListView(
            children: [
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: myFontSize),
                      children:  [
                        const TextSpan(
                            text: 'What is ASCII code?\n\n',
                            style: TextStyle(fontSize: 26)),
                        const TextSpan(text: 'The full form of ASCII is the '),
                        const TextSpan(
                          text: 'American Standard Code for information interchange ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                            text:
                                'It is a character encoding scheme used for electronics communication. '
                                'Each character or a special character is represented by some ASCII code, and each ascii code occupies 7 bits in memory.\n\n'
                                'In '),
                        TextSpan(
                            text: 'C programming language ',
                            style: const TextStyle(color: Colors.green),
                          recognizer: TapGestureRecognizer()..onTap = browseC,
                        ),
                        const TextSpan(
                            text:
                                'a character variable does not contain a character value itself rather '
                                'the ascii value of the character variable. The ascii value represents the character '
                                'variable in numbers, and each character variable is assigned with some number range '
                                'from 0 to 127. For example, the ascii value of \'A\' is 65. \n\nIn the above example, '
                                'we assign \'A\' to the character variable whose ascii value is 65, so 65 will be stored '
                                'in the character variable rather than \'A\'. '),
                        const TextSpan(
                            text:
                                '\n\nLet\'s understand through an example. \n\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'We will create a '),
                        TextSpan(
                            text: 'program ', style: const TextStyle(color: Colors.green),
                        recognizer: TapGestureRecognizer()..onTap = browseProgramming,
                        ),
                        // TextSpan(
                        //     text:
                        //         'which will display the ascii value of the character variable.',
                        //     style: TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(
                            text:
                                'which will display the ascii value of the character variable. '
                                    'A character variable does not contain a character value itself rather '
                                'the ascii value of the character variable. The ascii value represents the character '
                                'variable in numbers, and each character variable is assigned with some number range '
                                'from 0 to 127. For example, the ascii value of \'A\' is 65. \n\nIn the above example, '
                                'we assign \'A\' to the character variable whose ascii value is 65, so 65 will be stored '
                                'in the character variable rather than \'A\'.\n\n'),
                        const TextSpan(text: 'Let\'s understand through an example.\n\nWe will create a ', style: TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'program ',style: TextStyle(color: Colors.green)),
                        const TextSpan(text: ' which will display the ascii value of the character variable.'),
                      ]
                  ),
                ),
              const Image(
                  image: AssetImage('assets/1.png'),
                ),
              Text('In the above code, the first user will give the character input, '
                    'and the input will get stored in the \'ch\' variable.  If we print '
                    'the value of the \'ch\' variable by using %c format specifier, '
                    'then it will display \'A\' because we have given the character '
                    'input as \'A\', and if we use the %d format specifier then its '
                    'ascii value will be displayed, i.e., 65.\n',style: TextStyle(fontSize: myFontSize),),
              Text('Output\n\n',style: TextStyle(fontSize: myFontSize, fontWeight: FontWeight.bold),),
              const Image(
               image: AssetImage('assets/2.png'),
              ),
              Text('\n\nThe above output shows that the user gave the input as \'A\', '
              'and after giving input, the ascii value of \'A\' will get printed, i.e., 65.\n\n'
                  'Now, we will create a program which will display the ascii value of all the characters.\n',style: TextStyle(fontSize: myFontSize),
              ),
              const Image(
                image: AssetImage('assets/3.png'),
              ),
              Text('\nThe above program will display the ascii value of all the characters. '
                  'As we know that ascii value of all the characters starts from 0 and ends '
                  'at 255, so we iterate the for loop from 0 to 255\n\nNow we will create '
                  'the program which will sum the ascii value of a string.\n',style: TextStyle(fontSize: myFontSize),
              ),
              const Image(
                image: AssetImage('assets/4.png'),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: myFontSize,color: Colors.black),
                  children: const [
                    TextSpan(text: '\nIn the above code, we are taking user input as a string. After taking user input, we execute the' ),
                    TextSpan(text: ' while ',style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'loop which adds the ascii value of all the characters of a string and stores it in a '),
                    TextSpan(text: '\'sum\' ',style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'variable. \n\n'),

                    TextSpan(text: 'Output\n',style: TextStyle(fontWeight: FontWeight.bold)),

                  ]
                ),
              ),
              const Image(
                image: AssetImage('assets/5.png'),
              ),
              RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: myFontSize,color: Colors.black),
                      children: [
                        const TextSpan(text: '\n\nSource : '),
                        TextSpan(text: 'https://www.javatpoint.com/\n\n',
                          style: const TextStyle(
                              color: Colors.green,
                          ),
                          recognizer: TapGestureRecognizer()..onTap  = browseSource,
                          //recognizer: _sourceRecognizer
                        ),
                      ]
                  )
              )
            ],
          ),

        ),
      );

  }
  Future browseSource () async{
    const String url = 'https://www.javatpoint.com/';
    await launch(url);
  }
  Future browseC () async{
    const String url = 'https://www.javatpoint.com/c-programming-language-tutorial';
    await launch(url);
  }
  Future browseProgramming () async{
    const String url = 'https://www.codecademy.com/resources/blog/what-is-computer-programming/';
    await launch(url);
  }
}
