import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class TitleBox extends StatelessWidget {
  const TitleBox({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.2,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.15,
              decoration: BoxDecoration(
                color: kBeigeColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.2),
                  )
                ],
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 2,
                    horizontal: kDefaultPadding * 2),
                decoration: BoxDecoration(color: kBeigeColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: kBrownColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
