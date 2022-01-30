import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/constants.dart';
import 'package:prueba_adriana/helper/helperfunctions.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';
import 'package:prueba_adriana/screens/registro/registro_screen.dart';
import 'package:prueba_adriana/services/auth.dart';
import 'package:prueba_adriana/services/database.dart';

class InicioScreen extends StatefulWidget {
  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  String advertenciaInicio = "";
  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    bool isLoading = false;
    QuerySnapshot snapshotUserInfo;

    signIn() {
      if (formKey.currentState.validate() && advertenciaInicio == "") {
        HelperFunctions.saveEmailSharedPreference(emailController.text);

        databaseMethods.getUserByEmail(emailController.text).then((val) {
          snapshotUserInfo = val;
          HelperFunctions.saveNameSharedPreference(
              snapshotUserInfo.docs[0].get("name"));
        });

        setState(() {
          isLoading = true;
        });

        authMethods
            .signInWithEmailAndPassword(
                emailController.text, passwordController.text)
            .then((val) async {
          if (val != null) {
            HelperFunctions.saveLoggedInSharedPreference(true);
            Constants.myName = await HelperFunctions.getNameSharedPreference();
            Constants.myEmail =
                await HelperFunctions.getEmailSharedPreference();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        });
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: Image.asset("assets/images/LogoTransparente.png",
                scale: 2 / 1.5),
          ),
          //CONTENEDOR INICIO SESION

          Container(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding),
            margin: EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding),
            height: size.height * 0.41,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: kBeigeColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.2))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //EMAIL
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                        height: size.height * 0.077,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: size.height * 0.07,
                                width: size.width * 0.79,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: kPinkColor, width: 2.5)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: size.width * 0.1,
                                      height: size.height * 0.05,
                                      child: Icon(
                                        Icons.email_outlined,
                                        color: kBrownColor,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding / 4),
                                      width: size.width * 0.65,
                                      height: size.height * 0.05,
                                      child: TextFormField(
                                        validator: (val) {
                                          setState(() {
                                            if (RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val)) {
                                              advertenciaInicio = "";
                                            } else {
                                              advertenciaInicio =
                                                  "El correo ingresado no es válido";
                                            }
                                          });
                                          return null;
                                        },
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              "Escriba su correo electrónico",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: kDefaultPadding * 2,
                              child: Container(
                                height: size.height * 0.02,
                                width: size.width * 0.35,
                                decoration: BoxDecoration(
                                  color: kPinkColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(
                                  "Correo electrónico",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kBrownColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //PASSWORD
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                        height: size.height * 0.077,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: size.height * 0.07,
                                width: size.width * 0.79,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: kPinkColor, width: 2.5)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: size.width * 0.1,
                                      height: size.height * 0.05,
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: kBrownColor,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding / 4),
                                      width: size.width * 0.65,
                                      height: size.height * 0.05,
                                      child: TextFormField(
                                        validator: (val) {
                                          setState(() {
                                            if (val.length < 8) {
                                              advertenciaInicio =
                                                  "La contraseña debe ser mayor a 8 caracteres";
                                            }
                                          });
                                          return null;
                                        },
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Escriba su contraseña",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: kDefaultPadding * 2,
                              child: Container(
                                height: size.height * 0.02,
                                width: size.width * 0.35,
                                decoration: BoxDecoration(
                                  color: kPinkColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(
                                  "Contraseña",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kBrownColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //BOTON INGRESAR
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: FlatButton(
                      onPressed: () {
                        signIn();
                      },
                      child: Container(
                        height: size.height * 0.06,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "INGRESAR",
                              style: TextStyle(
                                  color: kBrownColor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: kPinkColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.2))
                            ]),
                      )),
                ),

                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Olvidé mi contraseña",
                      style: TextStyle(
                        color: kBrownColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Text(
                  advertenciaInicio,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ],
            ),
          ),

          //BOTON DE REGISTRO

          Container(
            margin: EdgeInsets.only(top: kDefaultPadding * 3),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
                  child: Text("¿No tienes aún una cuenta?"),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistroScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPinkColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.2))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: size.height * 0.07,
                      width: size.width * 0.9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "REGISTRATE",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              color: kBrownColor,
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                  height: kDefaultPadding * 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
