import 'package:chat_application/view/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
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
                    'Register New User',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                  // controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: const TextField(
                  // controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                  keyboardType: TextInputType.number,
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
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      Get.back();
                      // Get.to(() => SigninScreen());
                    },
                  )),
              Row(
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                      Get.back();
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              FloatingActionButton.extended(
                  onPressed: () {},
                  label: const Text('Sign Up with Google'),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  icon: Image.asset(
                    'assets/images/google.png',
                    height: 32,
                    width: 32,
                  )),
            ],
          ),
        ));
  }
}
