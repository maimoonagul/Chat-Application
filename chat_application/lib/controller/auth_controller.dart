import 'package:chat_application/view/profile_view.dart';
import 'package:chat_application/view/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var googleAccount =
      Rx<GoogleSignInAccount?>(null); // capture user information
  static AuthController instance =
      Get.find(); //access auth controller from other pages
  //firebase user initialization

  late Rx<User?> _user; //email, password, name... from firebase

  login() async {
    googleAccount.value = await _googleSignIn.signIn();
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  //init variables
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    //user would be notified
    _user.bindStream(_auth.userChanges()); //any changes will notify user
    ever(_user,
        _initialScreen); //takes a listener and callback ftn, listens to changes all the time
  }

  _initialScreen(User? user) {
    if (user == null) {
      //none has logged in yet
      Get.offAll(const SignUpScreen());
    } else {
      Get.offAll(ProfileView());
    }
  }

  Future<void> register(final email, password) async {
    //helper ftn called from sign up view
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password:
              password); //user create account, _user.bindStream is notified
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account Creation Failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }
}
