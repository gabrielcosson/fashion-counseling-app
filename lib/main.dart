import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/helperfunctions.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';
import 'package:prueba_adriana/screens/iniciarSesion/inicio_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Adriana Rojas',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kBeigeColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kBrownColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: InicioScreen());
  }
}
