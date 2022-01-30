import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/citas/components/citas_bottom_bar.dart';

import 'components/body.dart';

class CitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: CitasBottomBar(),
    );
  }

  AppBar buildAppBar() => AppBar(
        leading: Container(),
        elevation: 0,
      );
}
