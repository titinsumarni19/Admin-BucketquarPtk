import 'package:freezed_annotation/freezed_annotation.dart';
import './../user_profile/user_profile.dart';
import './../customer/customer.dart';

part 'order_transaction.freezed.dart';
part 'order_transaction.g.dart';

@unfreezed
class OrderTransaction with _$OrderTransaction {
  factory OrderTransaction({
    @Default(null) @JsonKey(name: '_id') String? id,
    @Default(null) @JsonKey(name: 'user_profile_id') String? userProfileId,
    @Default(null) @JsonKey(name: 'customer_id') String? customerId,
    @Default(null) @JsonKey(name: 'payment_method') String? paymentMethod,
    @Default(null) @JsonKey(name: 'order_status') String? orderStatus,
    @Default(null) @JsonKey(name: 'total') double? total,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null) @JsonKey(name: 'user_profile') UserProfile? userProfile,
    @Default(null) @JsonKey(name: 'customer') Customer? customer,
  }) = _OrderTransaction;

  factory OrderTransaction.fromJson(Map<String, dynamic> json) =>
      _$OrderTransactionFromJson(json);
}
