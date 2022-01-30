import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/maquillaje/components/division_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          TitleBox(text: "ROPA"),
          DivisionCard(division: "S U P E R I O R", categoriaMayor: "ROPA"),
          DivisionCard(division: "I N F E R I O R", categoriaMayor: "ROPA"),
          DivisionCard(division: "Z A P A T O S", categoriaMayor: "ROPA"),
          DivisionCard(division: "V E S T I D O S", categoriaMayor: "ROPA"),
          DivisionCard(division: "I N T E R I O R", categoriaMayor: "ROPA"),
        ],
      ),
    );
  }
}
