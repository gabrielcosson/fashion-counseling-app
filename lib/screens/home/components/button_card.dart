import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key key,
    this.image,
    this.text,
    this.press,
  }) : super(key: key);

  final String image;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding / 1.2,
        right: kDefaultPadding / 1.2,
        top: kDefaultPadding / 2,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: press,
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.35,
              decoration: BoxDecoration(
                  color: kBeigeColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ]),
              child: Image.asset(
                image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              text,
              style: TextStyle(
                  color: kBrownColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
