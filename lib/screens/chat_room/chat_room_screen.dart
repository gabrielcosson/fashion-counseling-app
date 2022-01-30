import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/constants.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';
import 'package:prueba_adriana/screens/conversation/conversation_screen.dart';
import 'package:prueba_adriana/screens/home/home_screen.dart';
import 'package:prueba_adriana/screens/search/search_screen.dart';
import 'package:prueba_adriana/services/auth.dart';
import 'package:prueba_adriana/services/database.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatRoomsStream;

  Widget ChatRoomList() {
    return Stack(
      children: [
        TitleBox(text: "CHATS"),
        Container(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          margin: EdgeInsets.only(top: kDefaultPadding * 5.5),
          child: StreamBuilder(
            stream: chatRoomsStream,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                          future: databaseMethods.getLastMessage(
                              snapshot.data.docs[index].get("chatRoomId")),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> text) {
                            return ChatRoomCard(
                                snapshot.data.docs[index]
                                    .get("chatRoomId")
                                    .toString()
                                    .replaceAll("*", "")
                                    .replaceAll(Constants.myEmail, ""),
                                snapshot.data.docs[index].get("chatRoomId"),
                                text.data);
                          },
                        );
                      },
                    )
                  : Container();
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    getChatRooms();
    super.initState();
  }

  getChatRooms() async {
    databaseMethods.getChatRooms(Constants.myEmail).then((value) {
      setState(() {
        chatRoomsStream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ChatRoomList(),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_box_outlined,
              color: kBrownColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kBrownColor,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      );
}

class ChatRoomCard extends StatelessWidget {
  final String toEmail;
  final String chatRoomId;
  final String message;

  ChatRoomCard(this.toEmail, this.chatRoomId, this.message);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(chatRoomId)));
      },
      child: Container(
        decoration: BoxDecoration(color: kBeigeColor, boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.2))
        ]),
        margin: EdgeInsets.symmetric(
            vertical: kDefaultPadding / 3, horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: kDefaultPadding * 2,
                    width: kDefaultPadding * 2,
                    decoration: BoxDecoration(
                      color: kPinkColor,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Text(
                      toEmail.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: kBrownColor),
                    )),
                SizedBox(
                  width: kDefaultPadding * 1.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      toEmail,
                      style: TextStyle(
                        color: kBrownColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      message == null
                          ? "Loading..."
                          : message.length >= 35
                              ? message.substring(0, 35) + "..."
                              : message,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
