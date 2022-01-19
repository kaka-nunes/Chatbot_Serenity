// ignore_for_file: non_constant_identifier_name, unused_import, prefer_const_constructors
import 'package:chatbot/views/home.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class PageInicial extends StatefulWidget {
  const PageInicial({Key? key}) : super(key: key);

  @override
  _PageInicialState createState() => _PageInicialState();
}

class _PageInicialState extends State<PageInicial> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }

  Widget _introScreen() {
    return SplashScreenView(
      navigateRoute: MyHomePage(),
      duration: 15000,
      //No celular não está rodando com a imagem
      //imageSize: 200,
      //imageSrc: "assets/Serenity.png",
      text: "SERENITY",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.blue.shade900,
        Colors.pink,
      ],
      backgroundColor: Colors.white,
    );
    /*body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 250.0,
              height: 250.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/Serenity.png'),
                ), //AssetImage("assets/Serenity.png"),
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: SplashScreenView(
                  navigateRoute: MyHomePage(),
                  duration: 3000,
                )),
          ],
        ),
      )),
    );*/
  }
}
