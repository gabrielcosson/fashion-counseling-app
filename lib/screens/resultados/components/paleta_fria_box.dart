import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/resultados/components/color_box.dart';

class PaletaFriaBox extends StatelessWidget {
  const PaletaFriaBox({
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
                    ColorBox(color: Color(0xFF2057A7)),
                    ColorBox(color: Color(0xFF6059A7)),
                    ColorBox(color: Color(0xFF1AA856)),
                    ColorBox(color: Color(0xFFD3363F)),
                    ColorBox(color: Color(0xFFF078BE)),
                    ColorBox(color: Color(0xFFFFFFFF)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorBox(color: Color(0xFF7C7FB2)),
                    ColorBox(color: Color(0xFFB35D88)),
                    ColorBox(color: Color(0xFFF27789)),
                    ColorBox(color: Color(0xFFFDC4D7)),
                    ColorBox(color: Color(0xFF5BC2D9)),
                    ColorBox(color: Color(0xFFBEBCB0)),
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
                "FRIA",
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
