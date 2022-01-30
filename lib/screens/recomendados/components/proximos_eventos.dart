import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class ProximosEventos extends StatelessWidget {
  const ProximosEventos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      Text(
        "PRÓXIMOS EVENTOS",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        margin:
            EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding * 2),
        height: size.height * 0.4,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.2))
          ],
          color: kPinkColor,
        ),
      ),
    ]);
  }
}
