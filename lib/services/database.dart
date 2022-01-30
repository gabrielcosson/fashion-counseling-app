import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByName(String name) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: name)
        .get();
  }

  getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  createUser(String email, userMap) {
    FirebaseFirestore.instance.collection("users").doc(email).set(userMap);
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId) //Crea un documento identificado con el chatRoomID
        .set(chatRoomMap) //Llena el documento con el mapa
        .catchError((e) {
      print(e);
    });
  }

  addConversationMessages(String chatRoomId, messageMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e.toString);
    });
  }

  getConversationMessages(String chatRoomId) async {
    return await FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("time", descending: false)
        .snapshots();
  }

  getChatRooms(String email) async {
    return await FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: email)
        .snapshots();
  }

  Future<String> getLastMessage(String chatRoomId) async {
    String message = "";
    await FirebaseFirestore.instance
        .collection('ChatRoom')
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("time", descending: true)
        .limit(1)
        .get()
        .then((value) {
      message = value.docs[0].get("message");
    });
    return message;
  }
}
