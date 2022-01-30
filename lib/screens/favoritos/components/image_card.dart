import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/favoritos/imagenes.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    this.imagen,
  }) : super(key: key);

  final Imagen imagen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
      child: Container(child: Image.asset(imagen.imagen)),
    );
  }
}
