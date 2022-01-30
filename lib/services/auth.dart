import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba_adriana/modulos/user.dart';

class AuthMethods {
  Usuario _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? Usuario(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final User user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
