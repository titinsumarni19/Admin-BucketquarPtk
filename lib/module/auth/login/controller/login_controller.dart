import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/dev_builder.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    super.initState();
    devLog(this.runtimeType.toString());
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    AuthService().logout().then((value) {
      print("Logout success");
      DevBuilderState.instance.refresh();
    });
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = kDebugMode ? "user@demo.com" : "";
  String password = kDebugMode ? "123456" : "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isNotValid => !formKey.currentState!.validate();

  Future<void> login() async {
    if (isNotValid) return;

    try {
      showLoading();
      await AuthService().login(
        email: email,
        password: password,
      );
      hideLoading();

      print(currentUser);
      print(currentUser);

      Get.offAll(MainNavigationView());
      DevBuilderState.instance.refresh();
    } on Exception catch (err) {
      hideLoading();
      se("Wrong email or password");
    }
  }
}
