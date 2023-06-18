import 'package:firebase_auth/firebase_auth.dart';
import 'package:nouvelle/service/database_service.dart';

import 'helper_functions.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      await DatabaseService(uid: user.uid).saveUserData(email);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // signout
  Future signOut() async {
    try {
      // clear the shared preference
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserEmailPrefs("");
      await HelperFunction.saveUserNamePrefs("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
