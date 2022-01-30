import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
    this.icon,
    this.text,
    this.press,
    this.bottom,
    this.top,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function press;
  final double bottom;
  final double top;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          padding: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
          child: Row(
            children: [
              Icon(icon),
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: Text(
                  text,
                  style: TextStyle(
                    color: kBrownColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
