import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/main_navigation_view.dart';

class MainNavigationController extends State<MainNavigationView> {
  static late MainNavigationController instance;
  late MainNavigationView view;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());

    loadData();
  }

  loadData() async {
    loading = true;
    setState(() {});

    await AuthService().initializeData(
      email: DBService.get("email")!,
      password: DBService.get("password")!,
    );

    DevBuilderState.instance.refresh();

    loading = false;
    setState(() {});
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Widget mainView = DashboardView();
  updateView(Widget view) {
    sidebarVisible = false;
    mainView = view;
    setState(() {});
  }

  bool sidebarVisible = false;
  showSidebar() {
    sidebarVisible = true;
    setState(() {});
  }

  hideSidebar() {
    sidebarVisible = false;
    setState(() {});
  }

  logout() async {
    Get.offAll(LoginView());
  }
}
