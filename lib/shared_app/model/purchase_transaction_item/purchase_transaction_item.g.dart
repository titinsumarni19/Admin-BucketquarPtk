// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseTransactionItemImpl _$$PurchaseTransactionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseTransactionItemImpl(
      id: json['_id'] as String? ?? null,
      purchaseTransactionId: json['purchase_transaction_id'] as String? ?? null,
      productId: json['product_id'] as String? ?? null,
      qty: (json['qty'] as num?)?.toInt() ?? null,
      purchasePrice: (json['purchase_price'] as num?)?.toDouble() ?? null,
      total: (json['total'] as num?)?.toDouble() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      purchaseTransaction: json['purchase_transaction'] == null
          ? null
          : PurchaseTransaction.fromJson(
              json['purchase_transaction'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseTransactionItemImplToJson(
        _$PurchaseTransactionItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'purchase_transaction_id': instance.purchaseTransactionId,
      'product_id': instance.productId,
      'qty': instance.qty,
      'purchase_price': instance.purchasePrice,
      'total': instance.total,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'purchase_transaction': instance.purchaseTransaction,
      'product': instance.product,
    };
