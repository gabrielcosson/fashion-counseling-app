import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/home/components/profile_box.dart';
import 'package:prueba_adriana/screens/home/components/recommendation_buttons.dart';
import 'package:prueba_adriana/screens/home/components/results_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        ProfileBox(size: size),
        ResultsButton(size: size),
        RecomendationButtons(),
      ]),
    );
  }
}
