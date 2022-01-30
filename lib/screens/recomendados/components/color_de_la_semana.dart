import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class ColorDeLaSemana extends StatelessWidget {
  const ColorDeLaSemana({
    Key key,
    this.color,
    this.nombre,
    this.descripcion,
  }) : super(key: key);

  final Color color;
  final String nombre;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      child: Column(
        children: [
          Text(
            "COLOR DE LA SEMANA",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            height: size.height * 0.4,
            width: size.width * 0.6,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2))
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: size.height * 0.2,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
                Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text(
                  "HEX: " + color.value.toRadixString(16).toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Text(
                  descripcion,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
