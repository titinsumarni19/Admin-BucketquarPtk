import 'package:hyper_ui/core.dart';

extension OrderTransactionServiceExtension on OrderTransactionService {
  Future<void> createDummies() async {
    await OrderTransactionService().create(
      userProfileId: currentUser!.id,
      customerId: await r.randomStringId('customer'),
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
        OrderTransactionService.lastInsertID!);
  }

  Future<void> createDummiesWithUniqueProducts(
      String orderTransactionId) async {
    var products = await ProductService().getAll();
    for (var product in products) {
      await OrderTransactionItemService().create(
        orderTransactionId: orderTransactionId,
        productId: product['id'],
        qty: 1,
        purchasePrice: double.tryParse("${product['purchase_price']}") ?? 0.0,
        sellingPrice: double.tryParse("${product['selling_price']}") ?? 0.0,
        profit: product['selling_price'] - product['purchase_price'],
      );
    }
  }
}
