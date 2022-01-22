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
      (instance) {
        dialogFlowtter = instance;
        _iniciarConversa();
      },
    );
  }

  void _iniciarConversa() async {
    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: "Ola")),
    );
    if (response.message == null) return;
    setState(
      () {
        addMessage(response.message!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ?? 'Serenity',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InfoPage(
                    title: 'Ajuda',
                  ),
                ),
              );
            },
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: messages.isNotEmpty,
              child: AppBody(messages: messages),
              replacement: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/bot.png",
                      width: 40,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Digitando...")
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 55.0,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
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
                      keyboardType: TextInputType.text,
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                        hintText: "Digite sua dúvida...",
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(
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
          ),
        ],
      ),
    );
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
