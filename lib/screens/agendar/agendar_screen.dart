import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/citas_screen.dart';

import 'components/body.dart';

class AgendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kBrownColor,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CitasScreen()));
          }),
      elevation: 0,
    );
  }
}
