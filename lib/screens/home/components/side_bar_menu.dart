import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/home/components/menu_button.dart';
import 'package:prueba_adriana/screens/iniciarSesion/inicio_screen.dart';
import 'package:prueba_adriana/screens/membresia/membresia_screen.dart';
import 'package:prueba_adriana/screens/recomendados/recomendados_screen.dart';
import 'package:prueba_adriana/services/auth.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({
    Key key,
  }) : super(key: key);

  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(height: kDefaultPadding * 3),
          Image.asset("assets/images/LogoTransparente.png"),
          Column(
            children: [
              MenuButton(
                icon: Icons.credit_card,
                text: "Adquirir membresía",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MembresiaScreen()));
                },
              ),
              MenuButton(
                icon: Icons.card_giftcard,
                text: "Recomendaciones y \ndescuentos",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecomendadosScreen()));
                },
              ),
              MenuButton(
                icon: Icons.assignment_outlined,
                text: "Repetir el Test",
                press: () {},
              ),
              MenuButton(
                icon: Icons.settings_outlined,
                text: "Configuración",
                press: () {},
              ),
              MenuButton(
                icon: Icons.exit_to_app,
                text: "Cerrar Sesión",
                press: () {
                  authMethods.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InicioScreen()));
                },
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(color: kPinkColor),
    );
  }
}
