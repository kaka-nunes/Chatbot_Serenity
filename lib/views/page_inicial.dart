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
              SizedBox(
                height: 35.0,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: 'Serenity',
                          )));
                },
                label: Text(
                  "Iniciar Conversa",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.purple,
              ),
            ]),
      )),
    );
  }
}
