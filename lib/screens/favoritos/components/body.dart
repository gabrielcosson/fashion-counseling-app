import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/favoritos/components/image_card.dart';
import 'package:prueba_adriana/screens/favoritos/imagenes.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

IconData icono = Icons.favorite;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          TitleBox(text: "MIS FAVORITOS"),
          for (int i = 0; i < imagenes.length; i++)
            Stack(
              children: [
                ImageCard(imagen: imagenes[i]),
                buildLikeButton(imagen: imagenes[i]),
              ],
            )
        ],
      ),
    );
  }

  Positioned buildLikeButton({Imagen imagen}) {
    return Positioned(
      bottom: kDefaultPadding,
      right: kDefaultPadding * 2,
      child: IconButton(
        icon: Icon(icono),
        color: Colors.red,
        iconSize: 40,
        onPressed: () {
          setState(() {
            if (!imagen.isLiked) {
              icono = Icons.favorite;
              print(imagen.isLiked);
              imagen.isLiked = true;
            } else {
              print(imagen.isLiked);
              icono = Icons.favorite_outline;
              imagen.isLiked = false;
            }
          });
        },
      ),
    );
  }
}
