import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/main_navigation_controller.dart';
import 'main_navigation_sidebar.dart';
import 'sidebar_header_item.dart';
import 'sidebar_menu_item.dart';

double sidebarWidth = 280;

class MainNavigationView extends StatefulWidget {
  MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return LayoutBuilder(builder: (context, constraints) {
      bool isTablet = MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 850;
      bool isDesktop = MediaQuery.of(context).size.width >= 1100;
      bool isMobile = MediaQuery.of(context).size.width < 850;
      bool tableMode = isDesktop || isTablet;

      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              if (tableMode)
                LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (tableMode) MainNavigationSidebar(),
                      Expanded(
                        child: controller.mainView,
                      ),
                    ],
                  );
                }),
              if (!tableMode)
                LayoutBuilder(builder: (context, constraints) {
                  return Stack(
                    children: [
                      Expanded(
                        child: controller.mainView,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        transform: Matrix4.translationValues(
                          controller.sidebarVisible ? 0 : -300,
                          0,
                          0,
                        ),
                        child: Row(
                          children: [
                            MainNavigationSidebar(),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  MainNavigationController.instance
                                      .hideSidebar();
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              if (!tableMode)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          //---------------------
                          if (controller.sidebarVisible) {
                            controller.hideSidebar();
                          } else {
                            controller.showSidebar();
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            controller.sidebarVisible
                                ? Icons.chevron_left
                                : Icons.chevron_right,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    });
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
