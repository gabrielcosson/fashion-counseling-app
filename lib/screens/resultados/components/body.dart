import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/resultados/components/estilo_box.dart';
import 'package:prueba_adriana/screens/resultados/components/forma_box.dart';
import 'package:prueba_adriana/screens/resultados/components/paleta_calida_box.dart';
import 'package:prueba_adriana/screens/resultados/components/paleta_fria_box.dart';
import 'package:prueba_adriana/screens/resultados/components/temperatura_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String estilo = "ROMANTICO";
    int paleta = 2; //1 es fria, 2 es calida

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          TitleBox(text: "RESULTADOS"),
          EstiloBox(size: size, estilo: estilo),
          TemperaturaBox(paleta: paleta),
          if (paleta == 1) PaletaFriaBox(),
          if (paleta == 2) PaletaCalidaBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormaBox(
                titulo: "ROSTRO",
                forma: "CUADRADA",
                figura: "CUADRADA",
              ),
              FormaBox(
                titulo: "CUERPO",
                forma: "RECTANGULO",
                figura: "RECTANGULAR",
              ),
            ],
          )
        ],
      ),
    );
  }
}
