
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/chat_detail_controller.dart';

class ChatDetailView extends StatefulWidget {
  const ChatDetailView({Key? key}) : super(key: key);

  Widget build(context, ChatDetailController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatDetail"),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<ChatDetailView> createState() => ChatDetailController();
}
    