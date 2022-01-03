// ignore_for_file: non_constant_identifier_name, unused_import
import 'package:chatbot/views/home.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:chatbot/second_Screen.dart';

class PageInicial extends StatefulWidget {
  const PageInicial({Key? key}) : super(key: key);

  @override
  _PageInicialState createState() => _PageInicialState();
}

class _PageInicialState extends State<PageInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: MyHomePage(),
        duration: 3000,
        imageSize: 130,
        imageSrc: "",
        backgroundColor: Colors.white,
      ),
    );
  }

  SecondScreen(Type myHomePage) {
    return MyHomePage();
  }
}
