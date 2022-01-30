import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/constants.dart';
import 'package:prueba_adriana/screens/chat_room/chat_room_screen.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/conversation/conversation_screen.dart';
import 'package:prueba_adriana/services/database.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchController = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethods.getUserByEmail(searchController.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return searchTile(
                name: searchSnapshot.docs[index].get('name'),
                email: searchSnapshot.docs[index].get('email'),
              );
            },
          )
        : Container();
  }

  createChatRoomAndStartConversation({String toEmail}) {
    if (toEmail != Constants.myEmail) {
      String chatRoomId = getChatRoomId(toEmail, Constants.myEmail);
      List<String> users = [toEmail, Constants.myEmail];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatRoomId": chatRoomId,
      };
      DatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConversationScreen(chatRoomId)));
    } else {
      print("You can not send message to yourself");
    }
  }

  Widget searchTile({String name, String email}) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              Text(email,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14)),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChatRoomAndStartConversation(toEmail: email);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.2))
                ],
                color: kPinkColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text("Message",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: [
            TitleBox(text: "BUSCAR"),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search by email...",
                    ),
                  )),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                        padding: EdgeInsets.all(kDefaultPadding / 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Icon(Icons.search, color: Colors.black)),
                  ),
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kBrownColor,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatRoomScreen()));
          },
        ),
      );
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\*$a";
  } else {
    return "$a\*$b";
  }
}
