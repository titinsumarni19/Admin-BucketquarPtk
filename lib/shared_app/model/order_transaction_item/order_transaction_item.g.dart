// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderTransactionItemImpl _$$OrderTransactionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderTransactionItemImpl(
      id: json['_id'] as String? ?? null,
      orderTransactionId: json['order_transaction_id'] as String? ?? null,
      productId: json['product_id'] as String? ?? null,
      qty: (json['qty'] as num?)?.toInt() ?? null,
      purchasePrice: (json['purchase_price'] as num?)?.toDouble() ?? null,
      sellingPrice: (json['selling_price'] as num?)?.toDouble() ?? null,
      profit: (json['profit'] as num?)?.toDouble() ?? null,
      total: (json['total'] as num?)?.toDouble() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      orderTransaction: json['order_transaction'] == null
          ? null
          : OrderTransaction.fromJson(
              json['order_transaction'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderTransactionItemImplToJson(
        _$OrderTransactionItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'order_transaction_id': instance.orderTransactionId,
      'product_id': instance.productId,
      'qty': instance.qty,
      'purchase_price': instance.purchasePrice,
      'selling_price': instance.sellingPrice,
      'profit': instance.profit,
      'total': instance.total,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'order_transaction': instance.orderTransaction,
      'product': instance.product,
    };
