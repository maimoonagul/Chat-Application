import 'package:chat_application/view/profile_view.dart';
import 'package:chat_application/view/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  get formKey => GlobalKey<FormState>();

  get userNameController => TextEditingController();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Form Key
  final _formKey = GlobalKey<FormState>();

  //Controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController= TextEditingController();

   //Authentication Controller
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    //Username
    final username = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.name,
       validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("User Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          userNameController.text = value!;
        },
      
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'User Name',
        prefixIcon: const Icon(Icons.mail),
      ),
    );

    //EmailField
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Email',
        prefixIcon: const Icon(Icons.mail),
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

     //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordController.text !=
              passwordController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //SignUp Button
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          authController.signUp(emailController.text, passwordController.text);
        },
        child: const Text(
          'SignUp',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    //Text
                    const Text(
                      'Instant Messaging',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 28),
                    ),
                    //SizedBox
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 25),
                    username,
                    //SizedBox
                    const SizedBox(height: 5),
                    //Email
                    email,
                    //SizedBox
                    const SizedBox(height: 5),
                    //Password
                    password,
                     const SizedBox(height: 5),
                     confirmPasswordField,
                    // Forgot Password
                    TextButton(
                      onPressed: () {
                        // Get.to(() => const ResetPasswordScreen());
                      },
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                    //SizedBox
                    const SizedBox(height: 15),
                    //SignUp Button
                    signupButton,
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
                    //SignUp using Google
                    FloatingActionButton.extended(
                        onPressed: () async {
                          await authController.login();
                          Get.to(() => ProfileView());
                        },
                        label: const Text('SignUp with Google'),
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
                        const Text("Already have an account?  "),
                        GestureDetector(
                          onTap: () {
                            Get.to(const SigninScreen());
                          },
                          child: const Text(
                            'SignIn',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          )),
        ));
  }
}
