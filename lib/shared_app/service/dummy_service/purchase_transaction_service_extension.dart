import 'package:hyper_ui/core.dart';

extension PurchaseTransactionServiceExtension on PurchaseTransactionService {
  Future<void> createDummies() async {
    await PurchaseTransactionService().create(
      userProfileId: currentUser!.id,
      supplierId: await r.randomStringId('supplier'),
      paymentMethod: r.firstValueFromList(["Cash", "Bank Transfer", "Emoney"]),
      orderStatus: r.firstValueFromList([
        "Order created",
        "Order packed",
        "Handed over to driver",
        "In transit",
        "Received",
        "Completed"
      ]),
      total: r.randomDouble(),
    );
    await createDummiesWithUniqueProducts(
        PurchaseTransactionService.lastInsertID!);
  }

  Future<void> createDummiesWithUniqueProducts(
      String purchaseTransactionId) async {
    var products = await ProductService().getAll();
    for (var product in products) {
      await PurchaseTransactionItemService().create(
        purchaseTransactionId: purchaseTransactionId,
        productId: product['id'],
        qty: 1,
        purchasePrice: r.randomDoubleBetween(1000, 10000),
      );
    }
  }
}
