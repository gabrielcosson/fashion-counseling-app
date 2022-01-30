import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({
    Key key,
    this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 4, horizontal: kDefaultPadding / 4),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.1,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2))
            ],
            color: color,
            border: Border.all(color: Colors.black.withOpacity(1))),
      ),
    );
  }
}
