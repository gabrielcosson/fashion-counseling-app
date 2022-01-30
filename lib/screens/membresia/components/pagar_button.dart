import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';

class BotonPagar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(
                top: kDefaultPadding, bottom: kDefaultPadding * 2),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "REALIZAR PAGO",
                        style: TextStyle(
                            color: kBrownColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: kPinkColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.2))
                      ]),
                ))),
      ],
    );
  }
}
