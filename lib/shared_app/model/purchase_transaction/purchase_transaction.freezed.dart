// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseTransaction _$PurchaseTransactionFromJson(Map<String, dynamic> json) {
  return _PurchaseTransaction.fromJson(json);
}

/// @nodoc
mixin _$PurchaseTransaction {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  String? get userProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  String? get supplierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  set supplierId(String? value) => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'supplier')
  Supplier? get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  set supplier(Supplier? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseTransactionCopyWith<PurchaseTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseTransactionCopyWith<$Res> {
  factory $PurchaseTransactionCopyWith(
          PurchaseTransaction value, $Res Function(PurchaseTransaction) then) =
      _$PurchaseTransactionCopyWithImpl<$Res, PurchaseTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'user_profile_id') String? userProfileId,
      @JsonKey(name: 'supplier_id') String? supplierId,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'supplier') Supplier? supplier});

  $UserProfileCopyWith<$Res>? get userProfile;
  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class _$PurchaseTransactionCopyWithImpl<$Res, $Val extends PurchaseTransaction>
    implements $PurchaseTransactionCopyWith<$Res> {
  _$PurchaseTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? supplierId = freezed,
    Object? paymentMethod = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? supplier = freezed,
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
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
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
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
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
  $SupplierCopyWith<$Res>? get supplier {
    if (_value.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_value.supplier!, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseTransactionImplCopyWith<$Res>
    implements $PurchaseTransactionCopyWith<$Res> {
  factory _$$PurchaseTransactionImplCopyWith(_$PurchaseTransactionImpl value,
          $Res Function(_$PurchaseTransactionImpl) then) =
      __$$PurchaseTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'user_profile_id') String? userProfileId,
      @JsonKey(name: 'supplier_id') String? supplierId,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'supplier') Supplier? supplier});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class __$$PurchaseTransactionImplCopyWithImpl<$Res>
    extends _$PurchaseTransactionCopyWithImpl<$Res, _$PurchaseTransactionImpl>
    implements _$$PurchaseTransactionImplCopyWith<$Res> {
  __$$PurchaseTransactionImplCopyWithImpl(_$PurchaseTransactionImpl _value,
      $Res Function(_$PurchaseTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? supplierId = freezed,
    Object? paymentMethod = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? supplier = freezed,
  }) {
    return _then(_$PurchaseTransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
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
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseTransactionImpl implements _PurchaseTransaction {
  _$PurchaseTransactionImpl(
      {@JsonKey(name: '_id') this.id = null,
      @JsonKey(name: 'user_profile_id') this.userProfileId = null,
      @JsonKey(name: 'supplier_id') this.supplierId = null,
      @JsonKey(name: 'payment_method') this.paymentMethod = null,
      @JsonKey(name: 'order_status') this.orderStatus = null,
      @JsonKey(name: 'total') this.total = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'user_profile') this.userProfile = null,
      @JsonKey(name: 'supplier') this.supplier = null});

  factory _$PurchaseTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseTransactionImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  String? id;
  @override
  @JsonKey(name: 'user_profile_id')
  String? userProfileId;
  @override
  @JsonKey(name: 'supplier_id')
  String? supplierId;
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
  @JsonKey(name: 'supplier')
  Supplier? supplier;

  @override
  String toString() {
    return 'PurchaseTransaction(id: $id, userProfileId: $userProfileId, supplierId: $supplierId, paymentMethod: $paymentMethod, orderStatus: $orderStatus, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, userProfile: $userProfile, supplier: $supplier)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseTransactionImplCopyWith<_$PurchaseTransactionImpl> get copyWith =>
      __$$PurchaseTransactionImplCopyWithImpl<_$PurchaseTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseTransactionImplToJson(
      this,
    );
  }
}

abstract class _PurchaseTransaction implements PurchaseTransaction {
  factory _PurchaseTransaction(
          {@JsonKey(name: '_id') String? id,
          @JsonKey(name: 'user_profile_id') String? userProfileId,
          @JsonKey(name: 'supplier_id') String? supplierId,
          @JsonKey(name: 'payment_method') String? paymentMethod,
          @JsonKey(name: 'order_status') String? orderStatus,
          @JsonKey(name: 'total') double? total,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'user_profile') UserProfile? userProfile,
          @JsonKey(name: 'supplier') Supplier? supplier}) =
      _$PurchaseTransactionImpl;

  factory _PurchaseTransaction.fromJson(Map<String, dynamic> json) =
      _$PurchaseTransactionImpl.fromJson;

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
  @JsonKey(name: 'supplier_id')
  String? get supplierId;
  @JsonKey(name: 'supplier_id')
  set supplierId(String? value);
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
  @JsonKey(name: 'supplier')
  Supplier? get supplier;
  @JsonKey(name: 'supplier')
  set supplier(Supplier? value);
  @override
  @JsonKey(ignore: true)
  _$$PurchaseTransactionImplCopyWith<_$PurchaseTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
