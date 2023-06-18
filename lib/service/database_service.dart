import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');

  Future saveUserData(String email) async {
    return await userCollection.doc(uid).set({
      "email": email,
      "groups": [],
      "friends": [],
      "profilePic": "",
      "uid": uid,
    });
  }

  userSearchListElements(userName) {
    List<String> userNameSearch = [];
    String item = "";
    for (int i = 0; i < userName.length; i++) {
      item = item + userName[i];
      userNameSearch.add(item.toLowerCase());
    }
    return userNameSearch;
  }

  Future getUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  updateUsername(String userName) {
    userCollection.doc(uid).update({
      "userName": userName,
      "userSearch": userSearchListElements(userName),
      "userNameLower": userName.toLowerCase(),
    });
  }
}
