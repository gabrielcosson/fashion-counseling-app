import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/citas';
import 'package:prueba_adriana/screens/citas/components/agendar_button.dart';
import 'package:prueba_adriana/screens/citas/components/citas_card.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleBox(text: "MIS CITAS"),
        AgendarButton(size: size),
        Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding * 1.5),
          child: Container(
            padding:
                EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: size.height * 0.48,
            width: size.width * 0.85,
            decoration: BoxDecoration(
                color: kBeigeColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.2))
                ],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: GridView.builder(
                itemCount: citas.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                  mainAxisSpacing: kDefaultPadding / 2,
                  crossAxisSpacing: kDefaultPadding,
                ),
                itemBuilder: (context, index) => CitasCard(
                      size: size,
                      cita: citas[index],
                    )),
          ),
        ),
      ],
    );
  }
}
