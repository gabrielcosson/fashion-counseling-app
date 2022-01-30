import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/maquillaje/components/division_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBox(text: "CABELLO"),
        DivisionCard(division: "P E I N A D O S", categoriaMayor: "CABELLO"),
        DivisionCard(division: "C O L O R", categoriaMayor: "CABELLO"),
      ],
    );
  }
}
