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
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 250.0,
              height: 250.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/Serenity.png'),
                  // fit: BoxFit.cover,
                ), //AssetImage("assets/Serenity.png"),
              ),
            ),
            SplashScreenView(
              navigateRoute: MyHomePage(),
              duration: 3000,
            )
          ],
        ),
      )),
    );
  }
}

      

          /*child: SplashScreenView(
            navigateRoute: MyHomePage(),
            duration: 3000,
            imageSize: 130,
            imageSrc: "Serenity.png",
            backgroundColor: Colors.white,
            
          ),*/

      

      /*SecondScreen(Type myHomePage) {
    return MyHomePage();
  }*/
   
