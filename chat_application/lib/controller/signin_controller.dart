import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninController extends GetxController {
  final _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var googleAccount =
      Rx<GoogleSignInAccount?>(null); // capture user information

  login() async {
    googleAccount.value = await _googleSignIn.signIn();
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
