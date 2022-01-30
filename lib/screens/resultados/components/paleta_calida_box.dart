import 'package:flutter/material.dart';

import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/resultados/components/color_box.dart';

class PaletaCalidaBox extends StatelessWidget {
  const PaletaCalidaBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Column(
        children: [
          Container(
            height: size.height * 0.15,
            width: size.width * 0.8,
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorBox(color: Color(0xFFB84739)),
                    ColorBox(color: Color(0xFF3E7031)),
                    ColorBox(color: Color(0xFFA39944)),
                    ColorBox(color: Color(0xFF1B7285)),
                    ColorBox(color: Color(0xFFF6B163)),
                    ColorBox(color: Color(0xFF4F3E37)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorBox(color: Color(0xFF0063A7)),
                    ColorBox(color: Color(0xFF48CEA9)),
                    ColorBox(color: Color(0xFF40C971)),
                    ColorBox(color: Color(0xFFD9364F)),
                    ColorBox(color: Color(0xFFE7BE7C)),
                    ColorBox(color: Color(0xFFED7773)),
                  ],
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PALETA ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                "CÁLIDA",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
