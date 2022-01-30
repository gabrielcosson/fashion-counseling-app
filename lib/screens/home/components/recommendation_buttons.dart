import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/accesorios/accesorios_screen.dart';
import 'package:prueba_adriana/screens/cabello/cabello_screen.dart';
import 'package:prueba_adriana/screens/home/components/button_card.dart';
import 'package:prueba_adriana/screens/maquillaje/maquillaje_screen.dart';
import 'package:prueba_adriana/screens/ropa/ropa_screen.dart';

class RecomendationButtons extends StatelessWidget {
  const RecomendationButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonCard(
                image: "assets/images/makeUp.png",
                text: "Maquillaje",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MaquillajeScreen()));
                },
              ),
              ButtonCard(
                  image: "assets/images/skirt.png",
                  text: "Ropa",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RopaScreen()));
                  }),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonCard(
                  image: "assets/images/accesories.png",
                  text: "Accesorios",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccesoriosScreen()));
                  }),
              ButtonCard(
                  image: "assets/images/hair.png",
                  text: "Cabello",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CabelloScreen()));
                  }),
            ],
          ),
        ),
        Container(
          height: kDefaultPadding,
        )
      ],
    );
  }
}
