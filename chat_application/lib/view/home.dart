import 'package:chat_application/view/signin_view.dart';
import 'package:chat_application/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
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
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: const Text(
                  'Welcome to Instant Messaging!',
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: const Text(
                  'Sign In to an existing account!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                )),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: ElevatedButton(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Get.to(() => SigninScreen());
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Does not have an account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.to(const SignUpScreen());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
