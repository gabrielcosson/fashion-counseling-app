import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/constants.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.22,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.15,
            decoration: BoxDecoration(color: kBeigeColor, boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.2),
              )
            ]),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.15,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2))
                  ],
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: kBrownColor,
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "HOLA\n",
                          style: TextStyle(
                              color: kBrownColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      TextSpan(
                          text: Constants.myName.split(" ").first.toUpperCase(),
                          style: TextStyle(
                              color: kBrownColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30))
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
