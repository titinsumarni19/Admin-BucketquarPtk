import 'package:hyper_ui/core.dart';

List devSidebarMenu = [
  if (isAdmin)
    SidebarMenuItem(
      icon: MdiIcons.circleSmall,
      label: "Delete current data",
      onTap: () async {
        try {
          showLoading();
          await DummyService().deleteCurrentData();
          hideLoading();
          Get.offAll(LoginView());
          ss("Delete current data success!");
        } on Exception catch (err) {
          printr(err.toString());
          printr("Failed to delete current data: $err");
          hideLoading();
          se("Failed to delete current data: $err");
        }
      },
    ),
  if (isAdmin)
    SidebarMenuItem(
      icon: MdiIcons.circleSmall,
      label: "Generate dummies",
      onTap: () async {
        try {
          showLoading();
          await DummyService().generateDummies();
          hideLoading();
          ss("Generate dummies success");
        } on Exception catch (err) {
          printr(err.toString());
          printr("Failed generate dummies: $err");
          hideLoading();
          se("Failed generate dummies: $err");
        }
      },
    ),
];
