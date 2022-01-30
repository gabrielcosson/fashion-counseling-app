import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/helperfunctions.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';
import 'package:prueba_adriana/screens/iniciarSesion/inicio_screen.dart';
import 'package:prueba_adriana/services/auth.dart';
import 'package:prueba_adriana/services/database.dart';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController nombreController = new TextEditingController();
  TextEditingController correoController = new TextEditingController();
  TextEditingController telefonoController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmacionController = new TextEditingController();
  String advertencia = "";

  signUp() {
    if (formKey.currentState.validate() && advertencia == "") {
      Map<String, String> userInfoMap = {
        "name": nombreController.text,
        "email": correoController.text,
        "phone": telefonoController.text,
      };

      HelperFunctions.saveNameSharedPreference(nombreController.text);
      HelperFunctions.saveEmailSharedPreference(correoController.text);

      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(
              correoController.text, passwordController.text)
          .then((val) {
        databaseMethods.createUser(correoController.text, userInfoMap);
        //HelperFunctions.saveLoggedInSharedPreference(true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => InicioScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding),
                        child: Text(
                          "ÚNETE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kBrownColor,
                            fontSize: 65,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 4,
                            horizontal: kDefaultPadding),
                        margin: EdgeInsets.symmetric(
                            vertical: kDefaultPadding,
                            horizontal: kDefaultPadding),
                        height: size.height * 0.5,
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
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //NOMBRE COMPLETO
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 4),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: kPinkColor, width: 2.5)),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: size.width * 0.1,
                                              height: size.height * 0.05,
                                              child: Icon(
                                                Icons.person_outlined,
                                                color: kBrownColor,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      kDefaultPadding / 4),
                                              width: size.width * 0.65,
                                              height: size.height * 0.05,
                                              child: TextFormField(
                                                validator: (val) {
                                                  setState(() {
                                                    if (val.isEmpty) {
                                                      advertencia =
                                                          "El nombre ingresado no es válido";
                                                    } else {
                                                      advertencia = "";
                                                    }
                                                  });
                                                  return null;
                                                  /*return val.isEmpty
                                                      ? "El nombre ingresado no es válido"
                                                      : null;*/
                                                },
                                                controller: nombreController,
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Escriba su nombre completo",
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Text(
                                          "Nombre Completo",
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

                              //CORREO ELECTRONICO

                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 4),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
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
                                                  horizontal:
                                                      kDefaultPadding / 4),
                                              width: size.width * 0.65,
                                              height: size.height * 0.05,
                                              child: TextFormField(
                                                validator: (val) {
                                                  setState(() {
                                                    if (RegExp(
                                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                        .hasMatch(val)) {
                                                    } else {
                                                      advertencia =
                                                          "El correo ingresado no es válido";
                                                    }
                                                  });
                                                  return null;
                                                },
                                                controller: correoController,
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
                              //TELEFONO

                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 4),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: kPinkColor, width: 2.5)),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: size.width * 0.1,
                                              height: size.height * 0.05,
                                              child: Icon(
                                                Icons.call_outlined,
                                                color: kBrownColor,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      kDefaultPadding / 4),
                                              width: size.width * 0.65,
                                              height: size.height * 0.05,
                                              child: TextFormField(
                                                validator: (val) {
                                                  setState(() {
                                                    if (val.isEmpty) {
                                                      advertencia =
                                                          "El telefono ingresado no es válido";
                                                    }
                                                  });
                                                  return null;
                                                },
                                                controller: telefonoController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Escriba su teléfono",
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Text(
                                          "Teléfono",
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

                              //CONTRASENA

                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 4),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: kPinkColor, width: 2.5)),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: size.width * 0.1,
                                              height: size.height * 0.05,
                                              child: Icon(
                                                Icons.lock_outline_sharp,
                                                color: kBrownColor,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      kDefaultPadding / 4),
                                              width: size.width * 0.65,
                                              height: size.height * 0.05,
                                              child: TextFormField(
                                                validator: (val) {
                                                  setState(() {
                                                    if (val.length < 8) {
                                                      advertencia =
                                                          "La contraseña debe ser mayor a 8 caracteres";
                                                    }
                                                  });
                                                  return null;
                                                },
                                                controller: passwordController,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Escriba una contraseña",
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
// CONFIRMAR CONTRASENA
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 4),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: kPinkColor, width: 2.5)),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: size.width * 0.1,
                                              height: size.height * 0.05,
                                              child: Icon(
                                                Icons.lock_outline_sharp,
                                                color: kBrownColor,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      kDefaultPadding / 4),
                                              width: size.width * 0.65,
                                              height: size.height * 0.05,
                                              child: TextFormField(
                                                validator: (val) {
                                                  setState(() {
                                                    if (passwordController
                                                            .text ==
                                                        val) {
                                                    } else {
                                                      advertencia =
                                                          "Las contraseñas no coinciden";
                                                    }
                                                  });
                                                  return null;
                                                },
                                                controller:
                                                    confirmacionController,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Escriba la contraseña nuevamente",
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Text(
                                          "Confirmar Contraseña",
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
                      ),
                      Column(
                        children: [
                          //ADVERTENCIA
                          Container(
                            padding: EdgeInsets.only(top: kDefaultPadding),
                            child: Text(
                              advertencia,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          //BOTON CREAR CUENTA
                          Padding(
                              padding: EdgeInsets.only(top: kDefaultPadding),
                              child: FlatButton(
                                  onPressed: () {
                                    signUp();
                                  },
                                  child: Container(
                                    height: size.height * 0.07,
                                    width: size.width * 0.9,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "CREAR CUENTA",
                                          style: TextStyle(
                                              color: kBrownColor,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: kPinkColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 10),
                                              blurRadius: 10,
                                              color:
                                                  Colors.black.withOpacity(0.2))
                                        ]),
                                  ))),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "¿Ya tienes una cuenta?",
                                style: TextStyle(),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InicioScreen()));
                                  },
                                  child: Text(
                                    "Inicia Sesión",
                                    style: TextStyle(
                                      color: kBrownColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
