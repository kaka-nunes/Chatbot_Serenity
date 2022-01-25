import 'dart:async';
import 'package:chatbot/views/page_inicial.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PageInicial(),
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/Serenity.png'),
                ), //AssetImage("assets/Serenity.png"),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CircularProgressIndicator(
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
