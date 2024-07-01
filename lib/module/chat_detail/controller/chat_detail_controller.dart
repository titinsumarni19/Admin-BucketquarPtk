
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/chat_detail_view.dart';

class ChatDetailController extends State<ChatDetailView> {
  static late ChatDetailController instance;
  late ChatDetailView view;

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
    