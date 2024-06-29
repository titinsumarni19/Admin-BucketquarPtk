// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderTransaction _$OrderTransactionFromJson(Map<String, dynamic> json) {
  return _OrderTransaction.fromJson(json);
}

/// @nodoc
mixin _$OrderTransaction {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  String? get userProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  set customerId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  set paymentMethod(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  String? get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  set orderStatus(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  set total(double? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  Customer? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  set customer(Customer? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTransactionCopyWith<OrderTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTransactionCopyWith<$Res> {
  factory $OrderTransactionCopyWith(
          OrderTransaction value, $Res Function(OrderTransaction) then) =
      _$OrderTransactionCopyWithImpl<$Res, OrderTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'user_profile_id') String? userProfileId,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'customer') Customer? customer});

  $UserProfileCopyWith<$Res>? get userProfile;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$OrderTransactionCopyWithImpl<$Res, $Val extends OrderTransaction>
    implements $OrderTransactionCopyWith<$Res> {
  _$OrderTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? customerId = freezed,
    Object? paymentMethod = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? customer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderTransactionImplCopyWith<$Res>
    implements $OrderTransactionCopyWith<$Res> {
  factory _$$OrderTransactionImplCopyWith(_$OrderTransactionImpl value,
          $Res Function(_$OrderTransactionImpl) then) =
      __$$OrderTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'user_profile_id') String? userProfileId,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'customer') Customer? customer});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$OrderTransactionImplCopyWithImpl<$Res>
    extends _$OrderTransactionCopyWithImpl<$Res, _$OrderTransactionImpl>
    implements _$$OrderTransactionImplCopyWith<$Res> {
  __$$OrderTransactionImplCopyWithImpl(_$OrderTransactionImpl _value,
      $Res Function(_$OrderTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? customerId = freezed,
    Object? paymentMethod = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? customer = freezed,
  }) {
    return _then(_$OrderTransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderTransactionImpl implements _OrderTransaction {
  _$OrderTransactionImpl(
      {@JsonKey(name: '_id') this.id = null,
      @JsonKey(name: 'user_profile_id') this.userProfileId = null,
      @JsonKey(name: 'customer_id') this.customerId = null,
      @JsonKey(name: 'payment_method') this.paymentMethod = null,
      @JsonKey(name: 'order_status') this.orderStatus = null,
      @JsonKey(name: 'total') this.total = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'user_profile') this.userProfile = null,
      @JsonKey(name: 'customer') this.customer = null});

  factory _$OrderTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTransactionImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  String? id;
  @override
  @JsonKey(name: 'user_profile_id')
  String? userProfileId;
  @override
  @JsonKey(name: 'customer_id')
  String? customerId;
  @override
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  @override
  @JsonKey(name: 'order_status')
  String? orderStatus;
  @override
  @JsonKey(name: 'total')
  double? total;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @override
  @JsonKey(name: 'user_profile')
  UserProfile? userProfile;
  @override
  @JsonKey(name: 'customer')
  Customer? customer;

  @override
  String toString() {
    return 'OrderTransaction(id: $id, userProfileId: $userProfileId, customerId: $customerId, paymentMethod: $paymentMethod, orderStatus: $orderStatus, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, userProfile: $userProfile, customer: $customer)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTransactionImplCopyWith<_$OrderTransactionImpl> get copyWith =>
      __$$OrderTransactionImplCopyWithImpl<_$OrderTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTransactionImplToJson(
      this,
    );
  }
}

abstract class _OrderTransaction implements OrderTransaction {
  factory _OrderTransaction(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'user_profile_id') String? userProfileId,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'customer') Customer? customer}) = _$OrderTransactionImpl;

  factory _OrderTransaction.fromJson(Map<String, dynamic> json) =
      _$OrderTransactionImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @JsonKey(name: '_id')
  set id(String? value);
  @override
  @JsonKey(name: 'user_profile_id')
  String? get userProfileId;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(String? value);
  @override
  @JsonKey(name: 'customer_id')
  String? get customerId;
  @JsonKey(name: 'customer_id')
  set customerId(String? value);
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @JsonKey(name: 'payment_method')
  set paymentMethod(String? value);
  @override
  @JsonKey(name: 'order_status')
  String? get orderStatus;
  @JsonKey(name: 'order_status')
  set orderStatus(String? value);
  @override
  @JsonKey(name: 'total')
  double? get total;
  @JsonKey(name: 'total')
  set total(double? value);
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value);
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value);
  @override
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value);
  @override
  @JsonKey(name: 'customer')
  Customer? get customer;
  @JsonKey(name: 'customer')
  set customer(Customer? value);
  @override
  @JsonKey(ignore: true)
  _$$OrderTransactionImplCopyWith<_$OrderTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
