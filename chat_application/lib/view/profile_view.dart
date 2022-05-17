import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signin_controller.dart';
import 'chats_view.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final controller = Get.put(SigninController());
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
          Text(
            // '<display name>',
            controller.googleAccount.value?.displayName ?? '',
            style: Get.textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            // '<display email>',
            controller.googleAccount.value?.email ?? '',
            style: Get.textTheme.bodyText1,
            textAlign: TextAlign.center,
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
