import 'package:hyper_ui/core.dart';

class DummyService {
  Future<void> deleteCurrentData() async {
    await OrderTransactionItemService().deleteAll();
    await OrderTransactionService().deleteAll();
    await PurchaseTransactionItemService().deleteAll();
    await PurchaseTransactionService().deleteAll();
    await SupplierService().deleteAll();
    await CustomerService().deleteAll();
    await ProductService().deleteAll();
    await ProductCategoryService().deleteAll();
    await UserProfileService().deleteAll();
  }

  Future<void> generateDummies() async {
    for (var i = 0; i < 5; i++) {
      await UserProfileService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await ProductCategoryService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await ProductService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await CustomerService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await SupplierService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await PurchaseTransactionService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await PurchaseTransactionItemService().createDummies();
    }
    for (var i = 0; i < 2; i++) {
      await OrderTransactionService().createDummies();
    }
    for (var i = 0; i < 2; i++) {
      await OrderTransactionItemService().createDummies();
    }
  }
}
