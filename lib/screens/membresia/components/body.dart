import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';
import 'package:prueba_adriana/screens/membresia/components/contenedor_membresia.dart';
import 'package:prueba_adriana/screens/membresia/components/information_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

bool checkBoxValue1 = false;
bool checkBoxValue2 = false;
Function isButtonDisabled;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        TitleBox(text: "MEMBRESIA"),
        InformationBox(),
        ContenedorMembresia(),

        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //CHECKBOX 1
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: checkBoxValue1,
                      activeColor: kBrownColor,
                      onChanged: (bool newValue1) {
                        setState(() {
                          checkBoxValue1 = newValue1;
                        });
                      }),
                  Text(
                    'Autorizo el cargo automático mensual a mi tarjeta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
//CHECKBOX 2
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: checkBoxValue2,
                      activeColor: kBrownColor,
                      onChanged: (bool newValue2) {
                        setState(() {
                          checkBoxValue2 = newValue2;
                          if (checkBoxValue2 == true) {
                            isButtonDisabled = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            };
                          }
                          if (checkBoxValue2 == false) {
                            isButtonDisabled = null;
                          }
                        });
                      }),
                  Text(
                    'Acepto los ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Terminos y Condiciones ',
                    style: TextStyle(
                        color: kBrownColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ],
          ),
        ),

        //BOTON DE PAGO

        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(5, 10),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.3))
            ]),
            child: FlatButton(
              height: size.height * 0.075,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: kPinkColor,
              textColor: kBrownColor,
              disabledTextColor: Colors.grey.shade800,
              disabledColor: Colors.grey.shade500,
              onPressed: isButtonDisabled,
              child: Text(
                "REALIZAR PAGO",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
