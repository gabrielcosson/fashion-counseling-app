import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/agendar/agendar_screen.dart';

class AgendarButton extends StatelessWidget {
  const AgendarButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 10,
          color: Colors.black.withOpacity(0.3),
        )
      ]),
      height: size.height * 0.065,
      width: size.width * 0.85,
      child: FlatButton(
        color: kPinkColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          "AGENDAR",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: kBrownColor,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AgendarScreen()));
        },
      ),
    );
  }
}
