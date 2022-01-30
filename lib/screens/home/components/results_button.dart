import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/resultados/resultados_screen.dart';

class ResultsButton extends StatelessWidget {
  const ResultsButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResultadosScreen()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          alignment: Alignment.center,
          height: size.height * 0.07,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
              color: kPinkColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            "Resultados Personalizados",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
