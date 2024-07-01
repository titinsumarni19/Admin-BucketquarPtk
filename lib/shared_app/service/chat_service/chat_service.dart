import 'package:hyper_ui/core.dart';

class ChatService {
  static String? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? imageUrl,
    String? customerName,
    String? email,
    String? phone,
    String? address,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('chat').select(
      """
*
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (imageUrl != null) {
      query = query.eq('image_url', imageUrl);
    }
    if (customerName != null && customerName.isNotEmpty) {
      query = query.ilike('customer_name', '%$customerName%');
    }
    if (email != null) {
      query = query.eq('email', email);
    }
    if (phone != null) {
      query = query.eq('phone', phone);
    }
    if (address != null) {
      query = query.eq('address', address);
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

  Future<Map<String, dynamic>?> getCustomerById(String id) async {
    final response = await client
        .from('chat')
        .select(
          """
*
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    String? imageUrl,
    String? customerName,
    String? email,
    String? phone,
    String? address,
  }) async {
    try {
      var values = await client.from('chat').insert([
        {
          'image_url': imageUrl,
          'customer_name': customerName,
          'email': email,
          'phone': phone,
          'address': address,
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
    String? imageUrl,
    String? customerName,
    String? email,
    String? phone,
    String? address,
  }) async {
    try {
      var current = await getCustomerById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('chat')
          .update({
            'image_url': imageUrl ?? current['image_url'],
            'customer_name': customerName ?? current['customer_name'],
            'email': email ?? current['email'],
            'phone': phone ?? current['phone'],
            'address': address ?? current['address'],
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
      await client.from('chat').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('chat').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
