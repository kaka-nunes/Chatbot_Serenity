import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, required String title}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajuda ?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Card(
                color: Colors.grey.shade100,
                child: SizedBox(
                  width: 350.0,
                  height: 600.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              alignment: Alignment.center,
                              image: AssetImage('assets/cvv.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          'O CVV realiza apoio emocional e prevenção do suicídio,'
                          ' através de atendimento voluntário e gratuito para pessoas que querem e precisam conversar. '
                          ' Atendimento sob total sigilo por telefone, email e chat 24 horas todos os dias.  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FloatingActionButton.extended(
                              onPressed: () async {
                                const url = 'https://www.cvv.org.br/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              label: const Text(
                                "CVV",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.purple,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              alignment: Alignment.center,
                              image: AssetImage('assets/pp.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Plantão Psicológico Voluntário e Psicoterapia Social. Atendimento Online.',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            size: 50.0,
                            color: Colors.purple,
                          ),
                          onPressed: () async {
                            const url =
                                'https://www.instagram.com/psicologosdeplantao_/?hl=pt-br';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        )
                        /**/
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage('assets/msg.png'),
                  ), //AssetImage("assets/Serenity.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
