import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class InformationBox extends StatelessWidget {
  const InformationBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ADQUIRIR LA MEMBRESIA",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: kBrownColor,
          ),
        ),
        Text(
          "\$50.000",
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w800,
            color: kBrownColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: Text(
            "este cargo se realiza mensualmente y puede ser cancelado en cualquier momento",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: kBrownColor,
            ),
          ),
        ),
      ],
    );
  }
}
