import 'package:chat_application/view/profile_view.dart';
import 'package:chat_application/view/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final controller = Get.put(AuthController());
    //Username
    final username = TextField(
      autofocus: false,
      controller: nameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'User Name',
        prefixIcon: const Icon(Icons.person),
      ),
    );

    //Email
    final email = TextField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Email',
        prefixIcon: const Icon(Icons.mail),
      ),
    );

    //Password
    final password = TextField(
      autofocus: false,
      obscureText: true,
      textInputAction: TextInputAction.done,
      controller: passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Password',
        prefixIcon: const Icon(Icons.vpn_key),
      ),
    );

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
                child: username,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: email,
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: password,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      controller.register(emailController, passwordController);
                      // Get.to(ProfileView());
                    },
                  )),
//Divider
              Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10, bottom: 0),
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.grey[700],
                      thickness: 1,
                      indent: 2,
                    )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: Text("Or",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18)),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.grey[700],
                      thickness: 1,
                      indent: 2,
                    ))
                  ])),

              FloatingActionButton.extended(
                  onPressed: () async {
                    await controller.login();
                    Get.to(ProfileView());
                  },
                  label: const Text('Sign Up with Google'),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  icon: Image.asset(
                    'assets/images/google.png',
                    height: 32,
                    width: 32,
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
                      Get.to(() => SigninScreen());
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ));
  }
}
