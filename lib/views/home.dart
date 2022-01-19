import 'package:chatbot/views/info_page.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_body.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    DialogFlowtter.fromFile(
      path: "assets/credentials.json",
      projectId: "chatbot-serenity",
    ).then(
      (instance) => dialogFlowtter = instance,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title ?? 'Serenity',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          /*Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 35.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage('assets/bot.jpg'),
                    ), //AssetImage("assets/Serenity.png"),
                  ),
                ),
                Text(
                  widget.title ?? 'Serenity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),*/
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
              icon: Icon(Icons.info_outlined),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InfoPage(
                          title: 'Ajuda',
                        )));
              },
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade100,
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /*Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.purple)),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Oi',
                        style: TextStyle(
                          color: Colors.black,
                        ))
                  ],
                ),
              ),*/
            ],
          ),
          Expanded(child: AppBody(messages: messages)),
          Container(
            height: 55.0,
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.purple),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.send,
                    size: 25.0,
                  ),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          )
        ] //),
            ));
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    // dialogFlowtter.projectId = "deimos-apps-0905";

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}
