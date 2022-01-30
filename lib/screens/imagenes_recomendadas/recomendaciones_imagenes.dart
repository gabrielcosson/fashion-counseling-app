import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/constants.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RecomendacionesDeImagenes extends StatelessWidget {
  final String division;
  final String categoriaMayor;
  RecomendacionesDeImagenes(this.division, this.categoriaMayor);

  @override
  Widget build(BuildContext context) {
    String path =
        "/" + categoriaMayor + "/" + division + "/" + Constants.myPaleta + "/";

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          TitleBox(text: division.toUpperCase()),
          Text(path),
          for (int i = 1; i <= 7; i++)
            FutureBuilder(
              future:
                  _getImage(context, "/FISICO" + path + i.toString() + ".jpg"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2,
                        horizontal: kDefaultPadding),
                    color: Colors.red,
                    child: snapshot.data,
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                }

                return Container();
              },
            )
        ],
      ),
    );
  }

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    await FirestoreStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return image;
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
      );
}

class FirestoreStorageService extends ChangeNotifier {
  FirestoreStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
