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
  if (isAdmin)
    SidebarMenuItem(
      icon: MdiIcons.circleSmall,
      label: "Stock Adjustment",
      onTap: () async {
        try {
          showLoading();
          {
            var res = await PurchaseTransactionService().getAll();
            for (var transaction in res) {
              var items = await PurchaseTransactionItemService().getAll(
                purchaseTransactionId: transaction["id"],
              );
              double total = 0.0;
              for (var item in items) {
                double subtotal = item["qty"] * item["purchase_price"];
                total += subtotal;

                await PurchaseTransactionItemService().update(
                  id: item["id"],
                  purchaseTransactionId: transaction["id"],
                  total: subtotal,
                );
              }

              await PurchaseTransactionService().update(
                id: transaction["id"],
                total: total,
              );
            }
          }
          {
            var res = await OrderTransactionService().getAll();
            for (var transaction in res) {
              var items = await OrderTransactionItemService().getAll(
                orderTransactionId: transaction["id"],
              );
              double total = 0.0;
              for (var item in items) {
                double subtotal = item["qty"] * item["selling_price"];
                double profit = item["qty"] * item["selling_price"] -
                    item["purchase_price"];
                total += subtotal;

                await OrderTransactionItemService().update(
                  id: item["id"],
                  orderTransactionId: transaction["id"],
                  profit: profit,
                  total: subtotal,
                );
              }

              await OrderTransactionService().update(
                id: transaction["id"],
                total: total,
              );
            }
          }
          //---------------------
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
