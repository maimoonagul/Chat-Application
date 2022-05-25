import 'package:chat_application/view/profile_view.dart';
import 'package:chat_application/view/signin_view.dart';
import 'package:chat_application/view/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user.dart';
import '../view/home.dart';

class AuthController extends GetxController {

  final _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var errorMessage = " ";
  var googleAccount =
      Rx<GoogleSignInAccount?>(null); // captures user information

  late Rx<User?> _user; //email, password, name... from firebase

  login() async {
    googleAccount.value = await _googleSignIn.signIn();
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.to(const SigninScreen());
  }

  @override
  //init variables
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
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

  // sign in function
  void signIn(String email, String password) async {
    if (const SigninScreen().formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "SignIn Successful"),
                  Get.to(ProfileView()),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }

  // sign up function
  void signUp(String email, String password) async {
    if (const SignUpScreen().formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // calling our user model
      User? user = _auth.currentUser;
       UserModel userModel = UserModel();   

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = const SignUpScreen().userNameController.text;

    // sending these values
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    // Get.offUntil(
    //     ProfileView(), (route) => false);
  }
}
