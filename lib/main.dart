// ignore_for_file: unused_import

import 'package:chatbot/views/home.dart';
import 'package:chatbot/views/page_inicial.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
//import 'package:splashscreen/splashscreen.dart';

void main(/*List<String> args*/) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageInicial(),
    );
  }
}
