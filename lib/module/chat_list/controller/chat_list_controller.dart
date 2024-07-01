
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/chat_list_view.dart';

class ChatListController extends State<ChatListView> {
  static late ChatListController instance;
  late ChatListView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    