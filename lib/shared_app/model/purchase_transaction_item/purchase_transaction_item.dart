import 'package:freezed_annotation/freezed_annotation.dart';
import './../purchase_transaction/purchase_transaction.dart';
import './../product/product.dart';

part 'purchase_transaction_item.freezed.dart';
part 'purchase_transaction_item.g.dart';

@unfreezed
class PurchaseTransactionItem with _$PurchaseTransactionItem {
  factory PurchaseTransactionItem({
    @Default(null) @JsonKey(name: '_id') String? id,
    @Default(null)
    @JsonKey(name: 'purchase_transaction_id')
    String? purchaseTransactionId,
    @Default(null) @JsonKey(name: 'product_id') String? productId,
    @Default(null) @JsonKey(name: 'qty') int? qty,
    @Default(null) @JsonKey(name: 'purchase_price') double? purchasePrice,
    @Default(null) @JsonKey(name: 'total') double? total,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null)
    @JsonKey(name: 'purchase_transaction')
    PurchaseTransaction? purchaseTransaction,
    @Default(null) @JsonKey(name: 'product') Product? product,
  }) = _PurchaseTransactionItem;

  factory PurchaseTransactionItem.fromJson(Map<String, dynamic> json) =>
      _$PurchaseTransactionItemFromJson(json);
}
