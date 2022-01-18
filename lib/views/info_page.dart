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
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/info.png'), fit: BoxFit.cover),
        ),
      ),
      Scaffold(
          appBar: AppBar(
            title: Text('Ajuda ?',
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
                      children: [
                SizedBox(
                  height: 30.0,
                ),
                Card(
                    color: Colors.grey.shade100,
                    child: SizedBox(
                      width: 330.0,
                      height: 500.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Centro de Valorização da Vida (CVC)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'O CVV realiza apoio emocional e prevenção do suicídio,'
                              ' através de atendimento voluntário e gratuito para pessoas que querem e precisam conversar. '
                              ' Atendimento sob total sigilo por telefone, email e chat 24 horas todos os dias.  ',
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

                                /* IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 50.0,
                              color: Colors.purple,
                            ),
                            onPressed: () async {
                              const url =
                                  'https://www.instagram.com/cvvoficial/?hl=pt-br';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          )*/
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Psicologos de Plantão',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Plantão Psicológico Voluntário e Psicoterapia Social. Atendimento Online.',
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
                    ))
              ]))))
    ]);
  }
}
