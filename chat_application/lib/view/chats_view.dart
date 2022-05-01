import 'package:flutter/material.dart';

import '../model/chat_helper_model.dart';
import '../model/chat_item_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  late TabController tabController;
  IconData? fabIcon;

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: Colors.blue,
        bottom: TabBar(
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
                child: Text(
              "STATUS",
            )),
            Tab(
                child: Text(
              "CALLS",
            )),
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const Icon(Icons.camera_alt),
          ListView.builder(itemCount: ChatHelper.chatList.length ,itemBuilder: (context, position) {
            ChatItemModel chatItem = ChatHelper.getChatItem(position);

            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.account_circle,
                        size: 64.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    chatItem.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0),
                                  ),
                                  Text(
                                    chatItem.messageDate,
                                    style:
                                        const TextStyle(color: Colors.black45),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  chatItem.mostRecentMessage,
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 16.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          }),
          // const Text("Chat Screen"),
          const Text("Status Screen"),
          const Text("Call Screen"),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
      ),
    );
  }
}
