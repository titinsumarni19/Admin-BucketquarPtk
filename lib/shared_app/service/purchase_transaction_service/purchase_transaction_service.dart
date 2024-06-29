import 'package:hyper_ui/core.dart';

class PurchaseTransactionService {
  static String? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? userProfileId,
    String? userProfileIdOperatorAndValue,
    String? supplierId,
    String? supplierIdOperatorAndValue,
    String? paymentMethod,
    String? orderStatus,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('purchase_transaction').select(
      """
*,
user_profile!inner(*),
supplier!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (supplierId != null) {
      query = query.eq('supplier_id', supplierId);
    }
    if (paymentMethod != null) {
      query = query.eq('payment_method', paymentMethod);
    }
    if (orderStatus != null) {
      query = query.eq('order_status', orderStatus);
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

  Future<Map<String, dynamic>?> getPurchaseTransactionById(String id) async {
    final response = await client
        .from('purchase_transaction')
        .select(
          """
*,
user_profile!inner(*),
supplier!inner(*)
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    String? userProfileId,
    String? supplierId,
    String? paymentMethod,
    String? orderStatus,
    double? total,
  }) async {
    try {
      var values = await client.from('purchase_transaction').insert([
        {
          'user_profile_id': userProfileId ?? 0,
          'supplier_id': supplierId ?? 0,
          'payment_method': paymentMethod,
          'order_status': orderStatus,
          'total': total ?? 0,
        }
      ]).exec();
      var id = values.first['id'];
      lastInsertID = id;

      return values.first;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<Map<String, dynamic>?> update({
    required String id,
    String? userProfileId,
    String? supplierId,
    String? paymentMethod,
    String? orderStatus,
    double? total,
  }) async {
    try {
      var current = await getPurchaseTransactionById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('purchase_transaction')
          .update({
            'user_profile_id': userProfileId ?? current['user_profile_id'],
            'supplier_id': supplierId ?? current['supplier_id'],
            'payment_method': paymentMethod ?? current['payment_method'],
            'order_status': orderStatus ?? current['order_status'],
            'total': total ?? current['total'],
          })
          .eq('id', id)
          .exec();

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> delete(String id) async {
    try {
      await client.from('purchase_transaction').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('purchase_transaction').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<num> getPurchaseTransactionTotalToday() async {
    return await sumToday('purchase_transaction', 'total');
  }

  Future<num> getPurchaseTransactionTotalThisWeek() async {
    return await sumThisWeek('purchase_transaction', 'total');
  }

  Future<num> getPurchaseTransactionTotalThisMonth() async {
    return await sumThisMonth('purchase_transaction', 'total');
  }

  Future<num> getPurchaseTransactionTotalThisYear() async {
    return await sumThisYear('purchase_transaction', 'total');
  }

  Future<List<Map<String, dynamic>>>
      getPurchaseTransactionMonthlyChart() async {
    return await monthlyChart('purchase_transaction', 'total');
  }
}
