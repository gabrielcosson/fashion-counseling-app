import 'package:flutter/material.dart';

class TemperaturaBox extends StatefulWidget {
  const TemperaturaBox({
    Key key,
    this.paleta,
  }) : super(key: key);
  final int paleta;

  @override
  _TemperaturaBoxState createState() => _TemperaturaBoxState();
}

class _TemperaturaBoxState extends State<TemperaturaBox> {
  Color colorCalida1;
  Color colorCalida2;
  String porcentajeCalida;
  Color colorFria1;
  Color colorFria2;
  String porcentajeFria;

  @override
  Widget build(BuildContext context) {
    if (widget.paleta == 1) {
      colorCalida1 = Colors.white;
      colorCalida2 = Colors.white;
      colorFria1 = Colors.blue[800];
      colorFria2 = Colors.lightBlue;
      porcentajeCalida = "";
      porcentajeFria = "50" + "%";
    }

    if (widget.paleta == 2) {
      colorCalida1 = Colors.orange[600];
      colorCalida2 = Colors.red[700];
      colorFria1 = Colors.white;
      colorFria2 = Colors.white;
      porcentajeCalida = "50" + "%";
      porcentajeFria = "";
    }
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 35, bottom: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 35, top: 35)),
                      Text(
                        'TEMPERATURA',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 92, 68, 46),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 60)),
                      Text(
                        'DE COLOR',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 92, 68, 46),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                //EL GRADIENTE
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8,
                                      0.0), // 10% of the width, so there are ten blinds.
                                  colors: [colorCalida1, colorCalida2],
                                ),
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                porcentajeCalida,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 35),
                        child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8,
                                    0.0), // 10% of the width, so there are ten blinds.
                                colors: [colorFria1, colorFria2],
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                porcentajeFria,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, right: 55),
                        child: Text(
                          'CÁLIDA ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 92, 68, 46),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, right: 55),
                        child: Text(
                          'FRIA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 92, 68, 46),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
