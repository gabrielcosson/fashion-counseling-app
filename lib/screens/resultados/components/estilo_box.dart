import 'package:flutter/material.dart';

import 'package:prueba_adriana/constants.dart';

class EstiloBox extends StatelessWidget {
  const EstiloBox({
    Key key,
    @required this.size,
    this.estilo,
  }) : super(key: key);

  final Size size;
  final String estilo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: size.height * 0.1,
      width: size.width * 0.85,
      decoration: BoxDecoration(
          color: kPinkColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.3))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: size.width * 0.2,
            child: Text(
              "ESTILO",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: kBrownColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: kDefaultPadding / 2),
            width: size.width * 0.5,
            child: Text(
              estilo,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: kBrownColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
