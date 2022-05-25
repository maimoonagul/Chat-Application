import 'package:chat_application/view/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //binding controller to app
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(
    home: HomeScreen(),
  ));
}

