import 'package:flutter/material.dart';
import 'package:chatbot/views/home.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
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
          title: const Text('Ajuda ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
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
                    width: 300.0,
                    height: 610.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 230.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              //border: Border.all(color: Colors.greyshade100)
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage('assets/cvv.png'),
                              ), //AssetImage("assets/Serenity.png"),
                            ),
                          ),
                          /*Text(
                            "Centro de Valoriza????o da Vida (CVC)",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),*/
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'O CVV realiza apoio emocional e preven????o do suic??dio,'
                            ' atrav??s de atendimento volunt??rio e gratuito para pessoas que querem e precisam conversar. '
                            ' Atendimento sob total sigilo por telefone (188), email e chat 24 horas todos os dias.  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
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
                                label: Text(
                                  "CVV",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.purple,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 250.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              // border: Border.all(color: Colors.purple),

                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage('assets/pp.png'),
                              ), //AssetImage("assets/Serenity.png"),
                            ),
                          ),
                          /*
                          Text(
                            'Psicologos de Plant??o',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),*/
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Planta??o Psicolo??gico Volunta??rio e Psicoterapia Social. Atendimento Online.',
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(
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
                  )),
              /* Container(
                alignment: Alignment.center,
                width: 300.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage('assets/msg.png'),
                  ), //AssetImage("assets/Serenity.png"),
                ),
              ),*/
            ]))));
  }
}
