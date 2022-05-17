import 'package:chat_application/view/profile_view.dart';
import 'package:chat_application/view/reset_password_view.dart';
import 'package:chat_application/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../controller/signin_controller.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);
  final controller =
      Get.put(SigninController()); //create instance of controller in view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child: const Text(
                  'Instant Messaging',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 28),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const TextField(
                obscureText: true,
                //controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const ResetPasswordScreen());
              },
              child: const Text(
                'Forgot Password?',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign In'),
                  onPressed: () {
                    Get.to(() => ProfileView());
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                    Get.to(() => const SignUpScreen());
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            FloatingActionButton.extended(
                onPressed: () async {
                  await controller.login();
                  Get.to(() => ProfileView());
                },
                label: const Text('Sign In with Google'),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                icon: Image.asset(
                  'assets/images/google.png',
                  height: 32,
                  width: 32,
                )),
          ],
        ),
      ),
    );
  }
}
