import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';

import 'components/body.dart';

class AccesoriosScreen extends StatefulWidget {
  @override
  _AccesoriosScreenState createState() => _AccesoriosScreenState();
}

class _AccesoriosScreenState extends State<AccesoriosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kBrownColor,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      );
}
