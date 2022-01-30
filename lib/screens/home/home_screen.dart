import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/constants.dart';
import 'package:prueba_adriana/helper/helperfunctions.dart';
import 'package:prueba_adriana/screens/chat_room/chat_room_screen.dart';
import 'package:prueba_adriana/screens/home/components/home_bottom_bar.dart';
import 'package:prueba_adriana/screens/home/components/side_bar_menu.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: buildDrawer(),
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: HomeBottomBar(),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: SideBarMenu(),
      );

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.message_outlined,
                color: kBrownColor,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatRoomScreen()));
              })
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: kBrownColor,
          ),
          onPressed: () {
            scaffoldKey.currentState.openDrawer();
          },
        ));
  }
}
