import 'package:chat_application/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user.dart';
import 'chats_view.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final controller = Get.put(AuthController());
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  
   @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    //TODO: Make obs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: Image.network(
                controller.googleAccount.value?.photoUrl ?? '',
              ).image,
              radius: 100,
            ),
          ),
          const SizedBox(
            height: 16,
          ),

          Container(
            child: loggedInUser.username == null
              ?Text(
              // '<display name>',
              controller.googleAccount.value?.displayName ?? '',
              style: Get.textTheme.headline4,
              textAlign: TextAlign.center,
            ): Text(
              '${loggedInUser.username}',
              style: Get.textTheme.headline4,
              textAlign: TextAlign.center,
            )
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            child: loggedInUser.email == null
            ?Text(
              // '<display email>',
              controller.googleAccount.value?.email ?? '',
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ): Text(
              // '<display email>',
              '${loggedInUser.email}',
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.center,
            )
          ),
          const SizedBox(
            height: 16,
          ),
          ActionChip(
            label: const Text('Open Chats'),
            onPressed: () {
              Get.to(() => const ChatScreen());
            },
            avatar: const Icon(Icons.message_rounded),
          ),
          const SizedBox(
            height: 16,
          ),
          ActionChip(
            label: const Text('Logout'),
            onPressed: () {
              controller.logout();
              Get.back();
            },
            avatar: const Icon(Icons.logout),
          )
        ]));
  }
}
