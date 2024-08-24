import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_firebase/models/userModel.dart';

class UserData {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> saveUserData(String uid,UserModel userModel) async {
    final CollectionReference users = db.collection('users');
    // final Map<String,dynamic> userData={
    //   ""
    // }
    final myUser = userModel.toJson();
    await users.doc(uid).set(myUser);
  }
}
