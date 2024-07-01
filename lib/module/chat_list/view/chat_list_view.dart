import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared_app/service/chat_service/chat_service.dart';
import '../controller/chat_list_controller.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({Key? key}) : super(key: key);

  Widget build(context, ChatListController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatList"),
        actions: const [],
      ),
      body: StreamList(
        key: UniqueKey(),
        future: ChatService().getAll(),
        itemBuilder: (itemMap, index) {
          return Text(
            "text",
            style: TextStyle(
              fontSize: 12.0,
            ),
          );
        },
      ),
    );
  }

  @override
  State<ChatListView> createState() => ChatListController();
}
