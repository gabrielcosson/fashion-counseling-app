import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/recomendados/components/color_de_la_semana.dart';
import 'package:prueba_adriana/screens/recomendados/components/cupon_del_dia.dart';
import 'package:prueba_adriana/screens/recomendados/components/proximos_eventos.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(children: [
      TitleBox(text: "RELEVANTES"),
      CuponDelDia(),
      ColorDeLaSemana(
          color: Color(0xFFCD0707),
          nombre: "PANTONE",
          descripcion: "Adrenaline Rush"),
      ProximosEventos(),
    ]);
  }
}
