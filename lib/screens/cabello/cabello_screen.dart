import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';

import 'components/body.dart';

class CabelloScreen extends StatefulWidget {
  @override
  _CabelloScreenState createState() => _CabelloScreenState();
}

class _CabelloScreenState extends State<CabelloScreen> {
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
