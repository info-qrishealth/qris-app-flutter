// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_total')
  double get orderTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection_charge')
  String get collectionCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_amount')
  double get paidAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  OrderStatus get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_mode')
  String get paymentMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_id')
  String? get txnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_code')
  String? get couponCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_data')
  String? get couponData => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_amount')
  double get couponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_cb_amount')
  double get couponCbAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'sc_coupon_amount')
  double get scCouponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_paid')
  double get walletPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'qris_coins_paid')
  double get qrisCoinsPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_record')
  String? get productRecord => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_slot_date')
  String get bookingSlotDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_slot_time')
  String? get bookingSlotTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_pin')
  String get bookingPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_address')
  String get bookingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'tube_type')
  String get tubeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'hard_copy')
  String get hardCopy => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred_by')
  String get referredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_booking_slot_time')
  String? get doctorBookingSlotTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_booking_address')
  String get invoice => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'order_total') double orderTotal,
      @JsonKey(name: 'collection_charge') String collectionCharge,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'order_status') OrderStatus orderStatus,
      @JsonKey(name: 'payment_mode') String paymentMode,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'coupon_code') String? couponCode,
      @JsonKey(name: 'coupon_data') String? couponData,
      @JsonKey(name: 'coupon_amount') double couponAmount,
      @JsonKey(name: 'coupon_cb_amount') double couponCbAmount,
      @JsonKey(name: 'sc_coupon_amount') double scCouponAmount,
      @JsonKey(name: 'wallet_paid') double walletPaid,
      @JsonKey(name: 'qris_coins_paid') double qrisCoinsPaid,
      @JsonKey(name: 'product_record') String? productRecord,
      @JsonKey(name: 'booking_slot_date') String bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') String? bookingSlotTime,
      @JsonKey(name: 'booking_pin') String bookingPin,
      @JsonKey(name: 'booking_address') String bookingAddress,
      @JsonKey(name: 'sample_type') String sampleType,
      @JsonKey(name: 'tube_type') String tubeType,
      @JsonKey(name: 'hard_copy') String hardCopy,
      @JsonKey(name: 'referred_by') String referredBy,
      @JsonKey(name: 'doctor_booking_slot_time') String? doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address') String invoice});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderDate = null,
    Object? orderTotal = null,
    Object? collectionCharge = null,
    Object? paidAmount = null,
    Object? orderStatus = null,
    Object? paymentMode = null,
    Object? txnId = freezed,
    Object? couponCode = freezed,
    Object? couponData = freezed,
    Object? couponAmount = null,
    Object? couponCbAmount = null,
    Object? scCouponAmount = null,
    Object? walletPaid = null,
    Object? qrisCoinsPaid = null,
    Object? productRecord = freezed,
    Object? bookingSlotDate = null,
    Object? bookingSlotTime = freezed,
    Object? bookingPin = null,
    Object? bookingAddress = null,
    Object? sampleType = null,
    Object? tubeType = null,
    Object? hardCopy = null,
    Object? referredBy = null,
    Object? doctorBookingSlotTime = freezed,
    Object? invoice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      collectionCharge: null == collectionCharge
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: freezed == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String?,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      couponData: freezed == couponData
          ? _value.couponData
          : couponData // ignore: cast_nullable_to_non_nullable
              as String?,
      couponAmount: null == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      couponCbAmount: null == couponCbAmount
          ? _value.couponCbAmount
          : couponCbAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scCouponAmount: null == scCouponAmount
          ? _value.scCouponAmount
          : scCouponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      walletPaid: null == walletPaid
          ? _value.walletPaid
          : walletPaid // ignore: cast_nullable_to_non_nullable
              as double,
      qrisCoinsPaid: null == qrisCoinsPaid
          ? _value.qrisCoinsPaid
          : qrisCoinsPaid // ignore: cast_nullable_to_non_nullable
              as double,
      productRecord: freezed == productRecord
          ? _value.productRecord
          : productRecord // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingSlotDate: null == bookingSlotDate
          ? _value.bookingSlotDate
          : bookingSlotDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingSlotTime: freezed == bookingSlotTime
          ? _value.bookingSlotTime
          : bookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingPin: null == bookingPin
          ? _value.bookingPin
          : bookingPin // ignore: cast_nullable_to_non_nullable
              as String,
      bookingAddress: null == bookingAddress
          ? _value.bookingAddress
          : bookingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      sampleType: null == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String,
      tubeType: null == tubeType
          ? _value.tubeType
          : tubeType // ignore: cast_nullable_to_non_nullable
              as String,
      hardCopy: null == hardCopy
          ? _value.hardCopy
          : hardCopy // ignore: cast_nullable_to_non_nullable
              as String,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
      doctorBookingSlotTime: freezed == doctorBookingSlotTime
          ? _value.doctorBookingSlotTime
          : doctorBookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'order_total') double orderTotal,
      @JsonKey(name: 'collection_charge') String collectionCharge,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'order_status') OrderStatus orderStatus,
      @JsonKey(name: 'payment_mode') String paymentMode,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'coupon_code') String? couponCode,
      @JsonKey(name: 'coupon_data') String? couponData,
      @JsonKey(name: 'coupon_amount') double couponAmount,
      @JsonKey(name: 'coupon_cb_amount') double couponCbAmount,
      @JsonKey(name: 'sc_coupon_amount') double scCouponAmount,
      @JsonKey(name: 'wallet_paid') double walletPaid,
      @JsonKey(name: 'qris_coins_paid') double qrisCoinsPaid,
      @JsonKey(name: 'product_record') String? productRecord,
      @JsonKey(name: 'booking_slot_date') String bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') String? bookingSlotTime,
      @JsonKey(name: 'booking_pin') String bookingPin,
      @JsonKey(name: 'booking_address') String bookingAddress,
      @JsonKey(name: 'sample_type') String sampleType,
      @JsonKey(name: 'tube_type') String tubeType,
      @JsonKey(name: 'hard_copy') String hardCopy,
      @JsonKey(name: 'referred_by') String referredBy,
      @JsonKey(name: 'doctor_booking_slot_time') String? doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address') String invoice});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderDate = null,
    Object? orderTotal = null,
    Object? collectionCharge = null,
    Object? paidAmount = null,
    Object? orderStatus = null,
    Object? paymentMode = null,
    Object? txnId = freezed,
    Object? couponCode = freezed,
    Object? couponData = freezed,
    Object? couponAmount = null,
    Object? couponCbAmount = null,
    Object? scCouponAmount = null,
    Object? walletPaid = null,
    Object? qrisCoinsPaid = null,
    Object? productRecord = freezed,
    Object? bookingSlotDate = null,
    Object? bookingSlotTime = freezed,
    Object? bookingPin = null,
    Object? bookingAddress = null,
    Object? sampleType = null,
    Object? tubeType = null,
    Object? hardCopy = null,
    Object? referredBy = null,
    Object? doctorBookingSlotTime = freezed,
    Object? invoice = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      collectionCharge: null == collectionCharge
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: freezed == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String?,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      couponData: freezed == couponData
          ? _value.couponData
          : couponData // ignore: cast_nullable_to_non_nullable
              as String?,
      couponAmount: null == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      couponCbAmount: null == couponCbAmount
          ? _value.couponCbAmount
          : couponCbAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scCouponAmount: null == scCouponAmount
          ? _value.scCouponAmount
          : scCouponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      walletPaid: null == walletPaid
          ? _value.walletPaid
          : walletPaid // ignore: cast_nullable_to_non_nullable
              as double,
      qrisCoinsPaid: null == qrisCoinsPaid
          ? _value.qrisCoinsPaid
          : qrisCoinsPaid // ignore: cast_nullable_to_non_nullable
              as double,
      productRecord: freezed == productRecord
          ? _value.productRecord
          : productRecord // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingSlotDate: null == bookingSlotDate
          ? _value.bookingSlotDate
          : bookingSlotDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingSlotTime: freezed == bookingSlotTime
          ? _value.bookingSlotTime
          : bookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingPin: null == bookingPin
          ? _value.bookingPin
          : bookingPin // ignore: cast_nullable_to_non_nullable
              as String,
      bookingAddress: null == bookingAddress
          ? _value.bookingAddress
          : bookingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      sampleType: null == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String,
      tubeType: null == tubeType
          ? _value.tubeType
          : tubeType // ignore: cast_nullable_to_non_nullable
              as String,
      hardCopy: null == hardCopy
          ? _value.hardCopy
          : hardCopy // ignore: cast_nullable_to_non_nullable
              as String,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
      doctorBookingSlotTime: freezed == doctorBookingSlotTime
          ? _value.doctorBookingSlotTime
          : doctorBookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'order_total') required this.orderTotal,
      @JsonKey(name: 'collection_charge') required this.collectionCharge,
      @JsonKey(name: 'paid_amount') required this.paidAmount,
      @JsonKey(name: 'order_status') required this.orderStatus,
      @JsonKey(name: 'payment_mode') required this.paymentMode,
      @JsonKey(name: 'txn_id') this.txnId,
      @JsonKey(name: 'coupon_code') this.couponCode,
      @JsonKey(name: 'coupon_data') this.couponData,
      @JsonKey(name: 'coupon_amount') required this.couponAmount,
      @JsonKey(name: 'coupon_cb_amount') required this.couponCbAmount,
      @JsonKey(name: 'sc_coupon_amount') required this.scCouponAmount,
      @JsonKey(name: 'wallet_paid') required this.walletPaid,
      @JsonKey(name: 'qris_coins_paid') required this.qrisCoinsPaid,
      @JsonKey(name: 'product_record') this.productRecord,
      @JsonKey(name: 'booking_slot_date') required this.bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') this.bookingSlotTime,
      @JsonKey(name: 'booking_pin') required this.bookingPin,
      @JsonKey(name: 'booking_address') required this.bookingAddress,
      @JsonKey(name: 'sample_type') required this.sampleType,
      @JsonKey(name: 'tube_type') required this.tubeType,
      @JsonKey(name: 'hard_copy') required this.hardCopy,
      @JsonKey(name: 'referred_by') required this.referredBy,
      @JsonKey(name: 'doctor_booking_slot_time') this.doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address') required this.invoice});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'order_date')
  final DateTime orderDate;
  @override
  @JsonKey(name: 'order_total')
  final double orderTotal;
  @override
  @JsonKey(name: 'collection_charge')
  final String collectionCharge;
  @override
  @JsonKey(name: 'paid_amount')
  final double paidAmount;
  @override
  @JsonKey(name: 'order_status')
  final OrderStatus orderStatus;
  @override
  @JsonKey(name: 'payment_mode')
  final String paymentMode;
  @override
  @JsonKey(name: 'txn_id')
  final String? txnId;
  @override
  @JsonKey(name: 'coupon_code')
  final String? couponCode;
  @override
  @JsonKey(name: 'coupon_data')
  final String? couponData;
  @override
  @JsonKey(name: 'coupon_amount')
  final double couponAmount;
  @override
  @JsonKey(name: 'coupon_cb_amount')
  final double couponCbAmount;
  @override
  @JsonKey(name: 'sc_coupon_amount')
  final double scCouponAmount;
  @override
  @JsonKey(name: 'wallet_paid')
  final double walletPaid;
  @override
  @JsonKey(name: 'qris_coins_paid')
  final double qrisCoinsPaid;
  @override
  @JsonKey(name: 'product_record')
  final String? productRecord;
  @override
  @JsonKey(name: 'booking_slot_date')
  final String bookingSlotDate;
  @override
  @JsonKey(name: 'booking_slot_time')
  final String? bookingSlotTime;
  @override
  @JsonKey(name: 'booking_pin')
  final String bookingPin;
  @override
  @JsonKey(name: 'booking_address')
  final String bookingAddress;
  @override
  @JsonKey(name: 'sample_type')
  final String sampleType;
  @override
  @JsonKey(name: 'tube_type')
  final String tubeType;
  @override
  @JsonKey(name: 'hard_copy')
  final String hardCopy;
  @override
  @JsonKey(name: 'referred_by')
  final String referredBy;
  @override
  @JsonKey(name: 'doctor_booking_slot_time')
  final String? doctorBookingSlotTime;
  @override
  @JsonKey(name: 'doctor_booking_address')
  final String invoice;

  @override
  String toString() {
    return 'Order(id: $id, orderDate: $orderDate, orderTotal: $orderTotal, collectionCharge: $collectionCharge, paidAmount: $paidAmount, orderStatus: $orderStatus, paymentMode: $paymentMode, txnId: $txnId, couponCode: $couponCode, couponData: $couponData, couponAmount: $couponAmount, couponCbAmount: $couponCbAmount, scCouponAmount: $scCouponAmount, walletPaid: $walletPaid, qrisCoinsPaid: $qrisCoinsPaid, productRecord: $productRecord, bookingSlotDate: $bookingSlotDate, bookingSlotTime: $bookingSlotTime, bookingPin: $bookingPin, bookingAddress: $bookingAddress, sampleType: $sampleType, tubeType: $tubeType, hardCopy: $hardCopy, referredBy: $referredBy, doctorBookingSlotTime: $doctorBookingSlotTime, invoice: $invoice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.orderTotal, orderTotal) ||
                other.orderTotal == orderTotal) &&
            (identical(other.collectionCharge, collectionCharge) ||
                other.collectionCharge == collectionCharge) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.txnId, txnId) || other.txnId == txnId) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.couponData, couponData) ||
                other.couponData == couponData) &&
            (identical(other.couponAmount, couponAmount) ||
                other.couponAmount == couponAmount) &&
            (identical(other.couponCbAmount, couponCbAmount) ||
                other.couponCbAmount == couponCbAmount) &&
            (identical(other.scCouponAmount, scCouponAmount) ||
                other.scCouponAmount == scCouponAmount) &&
            (identical(other.walletPaid, walletPaid) ||
                other.walletPaid == walletPaid) &&
            (identical(other.qrisCoinsPaid, qrisCoinsPaid) ||
                other.qrisCoinsPaid == qrisCoinsPaid) &&
            (identical(other.productRecord, productRecord) ||
                other.productRecord == productRecord) &&
            (identical(other.bookingSlotDate, bookingSlotDate) ||
                other.bookingSlotDate == bookingSlotDate) &&
            (identical(other.bookingSlotTime, bookingSlotTime) ||
                other.bookingSlotTime == bookingSlotTime) &&
            (identical(other.bookingPin, bookingPin) ||
                other.bookingPin == bookingPin) &&
            (identical(other.bookingAddress, bookingAddress) ||
                other.bookingAddress == bookingAddress) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.tubeType, tubeType) ||
                other.tubeType == tubeType) &&
            (identical(other.hardCopy, hardCopy) ||
                other.hardCopy == hardCopy) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.doctorBookingSlotTime, doctorBookingSlotTime) ||
                other.doctorBookingSlotTime == doctorBookingSlotTime) &&
            (identical(other.invoice, invoice) || other.invoice == invoice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderDate,
        orderTotal,
        collectionCharge,
        paidAmount,
        orderStatus,
        paymentMode,
        txnId,
        couponCode,
        couponData,
        couponAmount,
        couponCbAmount,
        scCouponAmount,
        walletPaid,
        qrisCoinsPaid,
        productRecord,
        bookingSlotDate,
        bookingSlotTime,
        bookingPin,
        bookingAddress,
        sampleType,
        tubeType,
        hardCopy,
        referredBy,
        doctorBookingSlotTime,
        invoice
      ]);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final int id,
      @JsonKey(name: 'order_date') required final DateTime orderDate,
      @JsonKey(name: 'order_total') required final double orderTotal,
      @JsonKey(name: 'collection_charge')
      required final String collectionCharge,
      @JsonKey(name: 'paid_amount') required final double paidAmount,
      @JsonKey(name: 'order_status') required final OrderStatus orderStatus,
      @JsonKey(name: 'payment_mode') required final String paymentMode,
      @JsonKey(name: 'txn_id') final String? txnId,
      @JsonKey(name: 'coupon_code') final String? couponCode,
      @JsonKey(name: 'coupon_data') final String? couponData,
      @JsonKey(name: 'coupon_amount') required final double couponAmount,
      @JsonKey(name: 'coupon_cb_amount') required final double couponCbAmount,
      @JsonKey(name: 'sc_coupon_amount') required final double scCouponAmount,
      @JsonKey(name: 'wallet_paid') required final double walletPaid,
      @JsonKey(name: 'qris_coins_paid') required final double qrisCoinsPaid,
      @JsonKey(name: 'product_record') final String? productRecord,
      @JsonKey(name: 'booking_slot_date') required final String bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') final String? bookingSlotTime,
      @JsonKey(name: 'booking_pin') required final String bookingPin,
      @JsonKey(name: 'booking_address') required final String bookingAddress,
      @JsonKey(name: 'sample_type') required final String sampleType,
      @JsonKey(name: 'tube_type') required final String tubeType,
      @JsonKey(name: 'hard_copy') required final String hardCopy,
      @JsonKey(name: 'referred_by') required final String referredBy,
      @JsonKey(name: 'doctor_booking_slot_time')
      final String? doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address')
      required final String invoice}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'order_date')
  DateTime get orderDate;
  @override
  @JsonKey(name: 'order_total')
  double get orderTotal;
  @override
  @JsonKey(name: 'collection_charge')
  String get collectionCharge;
  @override
  @JsonKey(name: 'paid_amount')
  double get paidAmount;
  @override
  @JsonKey(name: 'order_status')
  OrderStatus get orderStatus;
  @override
  @JsonKey(name: 'payment_mode')
  String get paymentMode;
  @override
  @JsonKey(name: 'txn_id')
  String? get txnId;
  @override
  @JsonKey(name: 'coupon_code')
  String? get couponCode;
  @override
  @JsonKey(name: 'coupon_data')
  String? get couponData;
  @override
  @JsonKey(name: 'coupon_amount')
  double get couponAmount;
  @override
  @JsonKey(name: 'coupon_cb_amount')
  double get couponCbAmount;
  @override
  @JsonKey(name: 'sc_coupon_amount')
  double get scCouponAmount;
  @override
  @JsonKey(name: 'wallet_paid')
  double get walletPaid;
  @override
  @JsonKey(name: 'qris_coins_paid')
  double get qrisCoinsPaid;
  @override
  @JsonKey(name: 'product_record')
  String? get productRecord;
  @override
  @JsonKey(name: 'booking_slot_date')
  String get bookingSlotDate;
  @override
  @JsonKey(name: 'booking_slot_time')
  String? get bookingSlotTime;
  @override
  @JsonKey(name: 'booking_pin')
  String get bookingPin;
  @override
  @JsonKey(name: 'booking_address')
  String get bookingAddress;
  @override
  @JsonKey(name: 'sample_type')
  String get sampleType;
  @override
  @JsonKey(name: 'tube_type')
  String get tubeType;
  @override
  @JsonKey(name: 'hard_copy')
  String get hardCopy;
  @override
  @JsonKey(name: 'referred_by')
  String get referredBy;
  @override
  @JsonKey(name: 'doctor_booking_slot_time')
  String? get doctorBookingSlotTime;
  @override
  @JsonKey(name: 'doctor_booking_address')
  String get invoice;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
