import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninController extends GetxController {
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null); // capture user information


  login() async{
    googleAccount.value = await _googleSignin.signIn();
  }
}
