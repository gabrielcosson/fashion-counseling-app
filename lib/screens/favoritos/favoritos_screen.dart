import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';

import 'components/body.dart';
import 'components/favoritos_bottom_bar.dart';

class FavoritosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: FavoritosBottomBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        elevation: 0,
        leading: Container(),
      );
}
