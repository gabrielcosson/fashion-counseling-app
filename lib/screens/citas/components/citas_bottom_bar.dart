import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/citas/citas_screen.dart';
import 'package:prueba_adriana/screens/favoritos/favoritos_screen.dart';
import 'package:prueba_adriana/screens/home/components/bottom_nav_bar.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';

class CitasBottomBar extends StatelessWidget {
  const CitasBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      icon1: Icons.home_outlined,
      icon2: Icons.favorite_border_outlined,
      icon3: Icons.notifications_on,
      press1: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      press2: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FavoritosScreen()));
      },
      press3: () {
        print("YOU ARE ALREADY THERE");
      },
    );
  }
}
