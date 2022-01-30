import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/imagenes_recomendadas/recomendaciones_imagenes.dart';

class DivisionCard extends StatelessWidget {
  const DivisionCard({
    Key key,
    this.division,
    this.categoriaMayor,
  }) : super(key: key);

  final String division;
  final String categoriaMayor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
          right: kDefaultPadding * 3, top: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecomendacionesDeImagenes(
                      division.replaceAll(" ", ""), categoriaMayor)));
        },
        child: Container(
          decoration: BoxDecoration(color: kPinkColor, boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.2),
            )
          ]),
          height: size.height * 0.1,
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                division,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
