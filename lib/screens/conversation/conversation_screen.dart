import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/helper/constants.dart';
import 'package:prueba_adriana/services/database.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  ConversationScreen(this.chatRoomId);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController messageController = new TextEditingController();
  Stream chatMessagesStream;

  Widget ChatMessageList() {
    return Container(
      margin:
          EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding * 4),
      child: StreamBuilder(
        stream: chatMessagesStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return MessageCard(
                      message: snapshot.data.docs[index].get("message"),
                      isSendByMe: snapshot.data.docs[index].get("sendBy") ==
                          Constants.myEmail,
                    );
                  },
                )
              : Container();
        },
      ),
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy": Constants.myEmail,
        "time": DateTime.now().millisecondsSinceEpoch,
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      messageController.text = "";
    }
  }

  @override
  void initState() {
    databaseMethods.getConversationMessages(widget.chatRoomId).then((value) {
      setState(() {
        chatMessagesStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(widget.chatRoomId),
        body: Container(
          child: Stack(
            children: [
              ChatMessageList(),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, -3),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.3))
                      ]),
                  padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                      horizontal: kDefaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: messageController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Send Message...",
                        ),
                      )),
                      GestureDetector(
                        onTap: () {
                          sendMessage();
                        },
                        child: Container(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xFFFF9E80),
                                const Color(0xFFFFC6A5),
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Icon(Icons.send, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  AppBar buildAppBar(String chatRoomId) => AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kBrownColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_horiz_outlined,
                color: kBrownColor,
              ),
              onPressed: () {})
        ],
        title: Text(
          chatRoomId.replaceAll("*", "").replaceAll(Constants.myEmail, ""),
          style: TextStyle(
            fontSize: 15,
            color: kBrownColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}

class MessageCard extends StatelessWidget {
  final String message;
  final bool isSendByMe;

  const MessageCard({Key key, this.message, this.isSendByMe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: isSendByMe ? kDefaultPadding * 4 : kDefaultPadding,
          right: isSendByMe ? kDefaultPadding : kDefaultPadding * 4),
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding * 0.8, horizontal: kDefaultPadding * 0.8),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.3),
              )
            ],
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(0),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(15),
                  ),
            gradient: LinearGradient(
                colors: isSendByMe
                    ? [
                        const Color(0xFFFF9E80),
                        const Color(0xFFFFC6A5),
                      ]
                    : [
                        Colors.grey[400],
                        Colors.grey[350],
                      ])),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
