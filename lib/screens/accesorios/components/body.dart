import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/maquillaje/components/division_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          TitleBox(text: "ACCESORIOS"),
          DivisionCard(
              division: "C O L L A R E S   Y   A R E T E S",
              categoriaMayor: "ACCESORIOS"),
          DivisionCard(
              division: "S O M B R E R O S", categoriaMayor: "ACCESORIOS"),
          DivisionCard(
              division: "P U L S E R A S   Y   R E L O J E S",
              categoriaMayor: "ACCESORIOS"),
          DivisionCard(division: "L E N T E S", categoriaMayor: "ACCESORIOS"),
          DivisionCard(
              division: "B O L S O S   Y   C A R T E R A S",
              categoriaMayor: "ACCESORIOS"),
          DivisionCard(
              division: "C I N T U R O N E S", categoriaMayor: "ACCESORIOS"),
          Container(
            height: kDefaultPadding,
          )
        ],
      ),
    );
  }
}
