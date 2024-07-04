import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

List get appMenuItems {
  return [
    //@APP_MENU
    {
      "icon": MdiIcons.circleSmall,
      "label": "User Profile",
      "view": UserProfileListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Product Category",
      "view": ProductCategoryListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Product",
      "view": ProductListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Customer",
      "view": CustomerListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Order Transaction",
      "view": OrderTransactionListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Order Transaction Item",
      "view": OrderTransactionItemListView(),
    },
    //@:APP_MENU
  ];
}

class AppMenuView extends StatelessWidget {
  const AppMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Menu"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppMenuGrid(),
          ],
        ),
      ),
    );
  }
}

class AppMenuGrid extends StatelessWidget {
  const AppMenuGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GridMenuItems(items: appMenuItems);
    });
  }
}
