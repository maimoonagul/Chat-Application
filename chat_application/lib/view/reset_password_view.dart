import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

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
                    'Reset Password',
                    style: TextStyle(fontSize: 20),
                  )),
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
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Send Reset Password Link'),
                    onPressed: () {
                      // print(nameController.text);
                      // print(passwordController.text);
                    },
                  )),
            ],
          ),
        ));
  }
}
