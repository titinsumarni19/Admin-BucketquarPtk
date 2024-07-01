import 'package:hyper_ui/core.dart';

class OrderTransactionItemService {
  static String? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? orderTransactionId,
    String? orderTransactionIdOperatorAndValue,
    String? productId,
    String? productIdOperatorAndValue,
    int? qty,
    String? qtyOperatorAndValue,
    double? purchasePrice,
    String? purchasePriceOperatorAndValue,
    double? sellingPrice,
    String? sellingPriceOperatorAndValue,
    double? profit,
    String? profitOperatorAndValue,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('order_transaction_item').select(
      """
*,
order_transaction!inner(*,user_profile!inner(*),customer!inner(*)),
product!inner(*,product_category!inner(*))
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (orderTransactionId != null) {
      query = query.eq('order_transaction_id', orderTransactionId);
    }
    if (productId != null) {
      query = query.eq('product_id', productId);
    }
    if (qtyOperatorAndValue != null) {
      query = query.eqo('qty', qtyOperatorAndValue);
    }
    if (purchasePriceOperatorAndValue != null) {
      query = query.eqo('purchase_price', purchasePriceOperatorAndValue);
    }
    if (sellingPriceOperatorAndValue != null) {
      query = query.eqo('selling_price', sellingPriceOperatorAndValue);
    }
    if (profitOperatorAndValue != null) {
      query = query.eqo('profit', profitOperatorAndValue);
    }
    if (totalOperatorAndValue != null) {
      query = query.eqo('total', totalOperatorAndValue);
    }
    if (createdAtFrom != null && createdAtTo != null) {
      final startOfDayFrom =
          DateTime(createdAtFrom.year, createdAtFrom.month, createdAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(createdAtTo.year, createdAtTo.month, createdAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('created_at', startOfDayFrom.toIso8601String())
          .lt('created_at', startOfDayTo.toIso8601String());
    }
    if (updatedAtFrom != null && updatedAtTo != null) {
      final startOfDayFrom =
          DateTime(updatedAtFrom.year, updatedAtFrom.month, updatedAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(updatedAtTo.year, updatedAtTo.month, updatedAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('updated_at', startOfDayFrom.toIso8601String())
          .lt('updated_at', startOfDayTo.toIso8601String());
    }

    var response = await query.order('id', ascending: false).exec();
    return List.from(response);
  }

  Future<Map<String, dynamic>?> getOrderTransactionItemById(String id) async {
    final response = await client
        .from('order_transaction_item')
        .select(
          """
*,
order_transaction!inner(*,user_profile!inner(*),customer!inner(*)),
product!inner(*,product_category!inner(*))
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    String? orderTransactionId,
    String? productId,
    int? qty,
    double? purchasePrice,
    double? sellingPrice,
    double? profit,
    double? total,
  }) async {
    try {
      if (await checkProductExist(
        orderTransactionId: orderTransactionId!,
        productId: productId!,
      )) {
        throw Exception("Product already added");
      }

      var values = await client.from('order_transaction_item').insert([
        {
          'order_transaction_id': orderTransactionId ?? 0,
          'product_id': productId ?? 0,
          'qty': qty ?? 0,
          'purchase_price': purchasePrice ?? 0,
          'selling_price': sellingPrice ?? 0,
          'profit': ((qty ?? 0) * ((sellingPrice ?? 0) - (purchasePrice ?? 0))),
          'total': total ?? 0,
        }
      ]).exec();
      var id = values.first['id'];
      lastInsertID = id;
      calculateTotal(orderTransactionId);

      return values.first;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<Map<String, dynamic>?> update({
    required String id,
    String? orderTransactionId,
    String? productId,
    int? qty,
    double? purchasePrice,
    double? sellingPrice,
    double? profit,
    double? total,
  }) async {
    try {
      var current = await getOrderTransactionItemById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('order_transaction_item')
          .update({
            'order_transaction_id':
                orderTransactionId ?? current['order_transaction_id'],
            'product_id': productId ?? current['product_id'],
            'qty': qty ?? current['qty'],
            'purchase_price': purchasePrice ?? current['purchase_price'],
            'selling_price': sellingPrice ?? current['selling_price'],
            'profit': ((qty ?? current['qty']) *
                ((sellingPrice ?? current['selling_price']) -
                    (purchasePrice ?? current['purchase_price']))),
            'total': total ?? current['total'],
          })
          .eq('id', id)
          .exec();
      calculateTotal(orderTransactionId!);

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> delete(String id) async {
    try {
      var current = await getOrderTransactionItemById(id);

      await client.from('order_transaction_item').delete().eq('id', id).exec();
      calculateTotal(current!['order_transaction_id']);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('order_transaction_item').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<bool> checkProductExist({
    required String orderTransactionId,
    required String productId,
  }) async {
    final response = await client
        .from('order_transaction_item')
        .select()
        .eq("order_transaction_id", orderTransactionId)
        .eq("product_id", productId)
        .exec();
    return response.isNotEmpty;
  }

  Future<void> calculateTotal(String orderTransactionId) async {
    try {
      List items = await client
          .from('order_transaction_item')
          .select(
            """
  id, qty, selling_price
  """,
          )
          .eq("order_transaction_id", orderTransactionId)
          .exec();
      var total = 0.0;
      for (var item in items) {
        var subtotal = item['qty']! * item['selling_price']!;
        total += subtotal;
      }

      await OrderTransactionService().update(
        id: orderTransactionId,
        total: total,
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> updateStock({
    required String orderTransactionId,
    required String productId,
    int? currentQty = 0,
  }) async {
    try {
      var item = await getOrderTransactionItemById(productId);
      var product = await ProductService().getProductById(item!['product_id']);
      var stock = product!['stock']! + currentQty - item['qty']!;

      printg("Update stock");
      printg("current: ${product["stock"]}");
      printg("old order qty: ${currentQty}");
      printg("new order qty: ${item['qty']}");
      printg("new stock: ${stock}");
      printg("--------------");

      await ProductService().update(
        id: item['product_id'],
        stock: stock,
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
