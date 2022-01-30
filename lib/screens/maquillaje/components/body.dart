import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/maquillaje/components/division_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBox(text: "MAQUILLAJE"),
        DivisionCard(division: "O J O S", categoriaMayor: "MAQUILLAJE"),
        DivisionCard(division: "L A B I O S", categoriaMayor: "MAQUILLAJE"),
        DivisionCard(division: "P I E L", categoriaMayor: "MAQUILLAJE"),
      ],
    );
  }
}
