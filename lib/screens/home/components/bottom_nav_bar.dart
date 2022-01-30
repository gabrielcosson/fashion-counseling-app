import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class BottomBar extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;

  final Function press1;
  final Function press2;
  final Function press3;

  const BottomBar(
      {Key key,
      this.icon1,
      this.icon2,
      this.icon3,
      this.press1,
      this.press2,
      this.press3})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: kDefaultPadding * 2,
          bottom: kDefaultPadding / 2,
          right: kDefaultPadding * 2),
      height: size.height * 0.08,
      decoration: BoxDecoration(color: kPinkColor, boxShadow: [
        BoxShadow(
          offset: Offset(0, -10),
          blurRadius: 20,
          color: Colors.black.withOpacity(0.35),
        )
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(icon1, color: kBrownColor, size: size.height * 0.04),
            onPressed: press1,
          ),
          IconButton(
            icon: Icon(icon2, color: kBrownColor, size: size.height * 0.04),
            onPressed: press2,
          ),
          IconButton(
            icon: Icon(icon3, color: kBrownColor, size: size.height * 0.04),
            onPressed: press3,
          ),
        ],
      ),
    );
  }
}
