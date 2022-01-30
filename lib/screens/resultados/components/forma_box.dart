import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class FormaBox extends StatelessWidget {
  const FormaBox({
    Key key,
    this.forma,
    this.titulo,
    this.figura,
  }) : super(key: key);

  final String forma;
  final String titulo;
  final String figura;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      margin: EdgeInsets.all(kDefaultPadding),
      height: size.height * 0.25,
      width: size.width * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: kBeigeColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "FORMA DEL " + titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: kBrownColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              print(figura);
            },
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              margin: EdgeInsets.only(
                  top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
              height: size.height * 0.1,
              width: size.width * 0.2,
              decoration: BoxDecoration(
                  color: kPinkColor,
                  border: Border.all(width: 2, color: kBrownColor),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.4))
                  ]),
            ),
          ),
          Text(
            forma,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: kBrownColor,
            ),
          ),
        ],
      ),
    );
  }
}
