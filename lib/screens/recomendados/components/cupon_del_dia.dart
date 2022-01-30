import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class CuponDelDia extends StatelessWidget {
  const CuponDelDia({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "CUPÓN DEL DIA",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          height: size.height * 0.15,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: kPinkColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                )
              ]),
          child: Column(
            children: [
              Text(
                "30%",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
              ),
              Text(
                "de descuento en la peluquería de Chía usando el código AdrianaImagen",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
