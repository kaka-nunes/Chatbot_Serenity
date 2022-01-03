// ignore_for_file: unused_import

import 'package:chatbot/views/home.dart';
import 'package:chatbot/views/page_inicial.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:chatbot/second_Screen.dart';

void main(/*List<String> args*/) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: MyHomePage(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "Serenity.png",
      text: "SERENITY",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 35.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.pink,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      home: example1,
    );
  }
}
