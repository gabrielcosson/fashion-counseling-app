import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/citas';

class CitasCard extends StatelessWidget {
  const CitasCard({
    Key key,
    @required this.size,
    this.cita,
  }) : super(key: key);

  final Size size;
  final Cita cita;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: kDefaultPadding * 0.8,
              right: kDefaultPadding / 3,
              bottom: kDefaultPadding / 2,
              top: kDefaultPadding / 2),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
          height: size.height * 0.09,
          width: size.width * 0.65,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
          child: Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: cita.dia.toString().padLeft(2, "0") +
                          "/" +
                          cita.mes.toString().padLeft(2, "0") +
                          "\n",
                      style: TextStyle(
                        color: kBrownColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: cita.hora,
                      style: TextStyle(
                        color: kBrownColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
              ),
              Spacer(),
              Text(cita.categoria.toUpperCase(),
                  style: TextStyle(
                    color: kBrownColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ))
            ],
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.delete,
              color: kBrownColor,
              size: 25,
            ),
            onPressed: () {}),
      ],
    );
  }
}
