// ignore_for_file: unnecessary_const


import 'package:chat_application/view/profile_view.dart';
import 'package:chat_application/view/reset_password_view.dart';
import 'package:chat_application/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  get formKey => GlobalKey<FormState>();
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  //Authentication Controller
  final authController = Get.put(AuthController());

  //Editing Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var errorMessage = " ";
  @override
  Widget build(BuildContext context) {
    //Email TextField
    final email = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Email',
      ),
    );

    //Password TextField
    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for Signing In");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password (Min. 6 Characters)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Password',
      ),
    );

    //SignIn Button
    final signinButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          authController.signIn(emailController.text, passwordController.text);
        },
        child: const Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    //Scaffold
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Text
                    const Text(
                      'Instant Messaging',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 28),
                    ),
                    //SizedBox
                    const SizedBox(height: 20),
                    //Text
                    const Text(
                      'Welcome Back to Instant Messaging',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    //SizedBox
                    const SizedBox(height: 45),
                    //Email
                    email,
                    //SizedBox
                    const SizedBox(height: 25),
                    //Password
                    password,
                    // Forgot Password
                    TextButton(
                      onPressed: () {
                        Get.to(() => const ResetPasswordScreen());
                      },
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                    //SizedBox
                    const SizedBox(height: 15),
                    //SignIn Button
                    signinButton,
                    //SizedBox
                    const SizedBox(height: 5),
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
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 16)),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey[700],
                              thickness: 1,
                              indent: 2,
                            ),
                          )
                        ])),
                    //SignIn using Google
                    FloatingActionButton.extended(
                        onPressed: () async {
                          await authController.login();
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
                    //SizedBox
                    const SizedBox(height: 15),
                    //SignUp
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?  "),
                        GestureDetector(
                          onTap: () {
                            Get.to(const SignUpScreen());
                          },
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
