import 'package:flutter/material.dart';
import 'package:prueba_adriana/screens/citas/citas_screen.dart';
import 'package:prueba_adriana/screens/favoritos/favoritos_screen.dart';
import 'package:prueba_adriana/screens/home/components/bottom_nav_bar.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      icon1: Icons.home_filled,
      icon2: Icons.favorite_outline,
      icon3: Icons.notifications_on_outlined,
      press1: () {
        print("YOU ARE ALREADY THERE");
      },
      press2: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FavoritosScreen()));
      },
      press3: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CitasScreen()));
      },
    );
  }
}
