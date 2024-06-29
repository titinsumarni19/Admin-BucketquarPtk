// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderTransactionImpl _$$OrderTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderTransactionImpl(
      id: json['_id'] as String? ?? null,
      userProfileId: json['user_profile_id'] as String? ?? null,
      customerId: json['customer_id'] as String? ?? null,
      paymentMethod: json['payment_method'] as String? ?? null,
      orderStatus: json['order_status'] as String? ?? null,
      total: (json['total'] as num?)?.toDouble() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userProfile: json['user_profile'] == null
          ? null
          : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderTransactionImplToJson(
        _$OrderTransactionImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_profile_id': instance.userProfileId,
      'customer_id': instance.customerId,
      'payment_method': instance.paymentMethod,
      'order_status': instance.orderStatus,
      'total': instance.total,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_profile': instance.userProfile,
      'customer': instance.customer,
    };
