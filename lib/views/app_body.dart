import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBody extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const AppBody({
    Key? key,
    this.messages = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        var obj = messages[messages.length - 1 - i];
        Message message = obj['message'];

        bool isUserMessage = obj['isUserMessage'] ?? false;
        return Row(
          mainAxisAlignment:
              isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUserMessage)
              Image.asset(
                "assets/bot.png",
                width: 40,
              ),
            SizedBox(
              width: 5,
            ),
            _MessageContainer(
              message: message,
              isUserMessage: isUserMessage,
            ),
          ],
        );
      },
      separatorBuilder: (_, i) => Container(height: 10),
      itemCount: messages.length,
      reverse: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final Message message;
  final bool isUserMessage;

  _MessageContainer({
    Key? key,
    required this.message,
    this.isUserMessage = false,
  }) : super(key: key);

  final DateFormat formatter = DateFormat('hh:mm');

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      child: LayoutBuilder(
        builder: (context, constrains) {
          switch (message.type) {
            case MessageType.card:
              return _CardContainer(card: message.card!);
            case MessageType.text:
            default:
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: isUserMessage
                            ? Colors.white
                            : Colors.purple.shade200,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: isUserMessage
                                ? Colors.purple
                                : Colors.purple.shade200)),
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Text(
                        message.text?.text?[0] ?? '',
                        style: TextStyle(
                          color: isUserMessage ? Colors.black : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        formatter.format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 9,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ]),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}

class _CardContainer extends StatelessWidget {
  final DialogCard card;

  const _CardContainer({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (card.imageUri != null)
              Container(
                constraints: BoxConstraints.expand(height: 150),
                child: Image.network(
                  card.imageUri!,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    card.title ?? 'Serenity',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  if (card.subtitle != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        card.subtitle!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  if (card.buttons?.isNotEmpty ?? false)
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 40,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.symmetric(vertical: 5),
                        itemBuilder: (context, i) {
                          CardButton button = card.buttons![i];
                          return TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.purple,
                            ),
                            child: Text(button.text ?? ''),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(button.postback ?? ''),
                              ));
                            },
                          );
                        },
                        separatorBuilder: (_, i) => Container(width: 9.0),
                        itemCount: card.buttons!.length,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
