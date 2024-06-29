import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/main_navigation/view/main_navigation_view.dart';

class MainNavigationSidebar extends StatelessWidget {
  const MainNavigationSidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sidebarWidth,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Color(0xff443a3a),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 11),
          ),
        ],
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLogo(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SidebarHeaderItem(
                    title: "Main menu",
                  ),
                  SidebarMenuItem(
                    icon: MdiIcons.circleSmall,
                    label: "Dashboard",
                    view: DashboardView(),
                  ),
                  if (isAdmin && appMenuMasterDataItems.isNotEmpty)
                    SidebarHeaderItem(
                      title: "Master data",
                    ),
                  if (isAdmin)
                    ...List.generate(appMenuMasterDataItems.length, (index) {
                      var item = appMenuMasterDataItems[index];
                      if (item["disabled"] == true) return SizedBox.shrink();
                      var tableName = item["label"]
                          .toString()
                          .toLowerCase()
                          .replaceAll(" ", "_");
                      var module = ModuleConfig.getModule(tableName);
                      if (module?.name?.endsWith("_item") == true)
                        return Container();

                      return SidebarMenuItem(
                        icon: item["icon"] ?? Icons.list,
                        label: item["label"],
                        view: item["view"],
                      );
                    }),
                  if (appMenuTransactionItems.isNotEmpty)
                    SidebarHeaderItem(
                      title: "Transaction",
                    ),
                  ...List.generate(appMenuTransactionItems.length, (index) {
                    var item = appMenuTransactionItems[index];
                    if (item["disabled"] == true) return SizedBox.shrink();
                    var tableName = item["label"]
                        .toString()
                        .toLowerCase()
                        .replaceAll(" ", "_");
                    var module = ModuleConfig.getModule(tableName);
                    if (module?.name?.endsWith("_item") == true)
                      return Container();

                    return SidebarMenuItem(
                      icon: item["icon"] ?? Icons.list,
                      label: item["label"],
                      view: item["view"],
                    );
                  }),
                  if (appMenuReportItems.isNotEmpty)
                    SidebarHeaderItem(
                      title: "Report",
                    ),
                  ...List.generate(appMenuReportItems.length, (index) {
                    var item = appMenuReportItems[index];
                    if (item["disabled"] == true) return SizedBox.shrink();
                    var tableName = item["label"]
                        .toString()
                        .toLowerCase()
                        .replaceAll(" ", "_");
                    var module = ModuleConfig.getModule(tableName);
                    if (module?.name?.endsWith("_item") == true)
                      return Container();

                    return SidebarMenuItem(
                      icon: item["icon"] ?? Icons.list,
                      label: item["label"],
                      view: item["view"],
                    );
                  }),
                  SidebarHeaderItem(
                    title: "Settings",
                  ),
                  SidebarMenuItem(
                    icon: MdiIcons.circleSmall,
                    label: "Logout",
                    onTap: () => MainNavigationController.instance.logout(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
