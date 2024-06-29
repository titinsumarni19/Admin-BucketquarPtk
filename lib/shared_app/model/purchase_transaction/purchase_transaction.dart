import 'package:freezed_annotation/freezed_annotation.dart';
import './../user_profile/user_profile.dart';
import './../supplier/supplier.dart';

part 'purchase_transaction.freezed.dart';
part 'purchase_transaction.g.dart';

@unfreezed
class PurchaseTransaction with _$PurchaseTransaction {
  factory PurchaseTransaction({
    @Default(null) @JsonKey(name: '_id') String? id,
    @Default(null) @JsonKey(name: 'user_profile_id') String? userProfileId,
    @Default(null) @JsonKey(name: 'supplier_id') String? supplierId,
    @Default(null) @JsonKey(name: 'payment_method') String? paymentMethod,
    @Default(null) @JsonKey(name: 'order_status') String? orderStatus,
    @Default(null) @JsonKey(name: 'total') double? total,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null) @JsonKey(name: 'user_profile') UserProfile? userProfile,
    @Default(null) @JsonKey(name: 'supplier') Supplier? supplier,
  }) = _PurchaseTransaction;

  factory PurchaseTransaction.fromJson(Map<String, dynamic> json) =>
      _$PurchaseTransactionFromJson(json);
}
