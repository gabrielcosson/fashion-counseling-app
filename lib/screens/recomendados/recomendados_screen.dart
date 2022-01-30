import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';

import 'components/body.dart';

class RecomendadosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: kBrownColor,
        ),
      );
}
