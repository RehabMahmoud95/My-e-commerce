import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:getx_firebase/constants.dart';
import 'package:getx_firebase/screens/home/home_screen.dart';
import 'package:getx_firebase/screens/sign_in/sign_in_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    Constants.ifDebugMode("current user : ${auth.currentUser}");
    _user.bindStream(auth.userChanges());
    // ever is function in getx that allow you to know if current user null or not
    ever<User?>(_user, _startScreen);
  }

  _startScreen(User? user) {
    
    if (user == null) {
      Get.offAll(() => const SignInScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  Future register(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((UserCredential value) {
        return value.user!.uid;
        // print("current user id :::::::::::::::::::::::::" + value.user.uid);
      });
    } catch (e) {
      Get.snackbar("About User", "User Message",
          backgroundColor: Colors.lightBlueAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.red),
          ));
    }
  }

  Future<String> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } catch (e) {
      Get.snackbar("About User", "User Message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
          return "error";
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }

  void googleSignUp() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await auth.signInWithCredential(credential);
    }
  }
}
