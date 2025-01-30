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
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'bnk_txn_id')
  String? get bnkTxnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'razor_order_id')
  String get razorOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_code')
  String? get couponCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_data')
  String? get couponData => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_amount')
  double get couponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_type')
  String get couponType => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_cb_amount')
  double get couponCbAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'sc_coupon_id')
  String? get scCouponId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sc_coupon_amount')
  double get scCouponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'sc_coupon_done')
  int get scCouponDone => throw _privateConstructorUsedError;
  @JsonKey(name: 'cb_amount_done')
  String get cbAmountDone => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_paid')
  double get walletPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'qris_coins_paid')
  double get qrisCoinsPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'qris_coins_done')
  String get qrisCoinsDone => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_respons')
  String? get paymentRespons => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'agent_id')
  int get agentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent_discount_amt')
  double get agentDiscountAmt => throw _privateConstructorUsedError;
  @JsonKey(name: 'headoffice_collection')
  String get headofficeCollection => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred_by')
  String get referredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_booking_slot_time')
  String? get doctorBookingSlotTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_booking_address')
  String get doctorBookingAddress => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'order_total') double orderTotal,
      @JsonKey(name: 'collection_charge') String collectionCharge,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'order_status') OrderStatus orderStatus,
      @JsonKey(name: 'payment_mode') String paymentMode,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'bnk_txn_id') String? bnkTxnId,
      @JsonKey(name: 'razor_order_id') String razorOrderId,
      @JsonKey(name: 'coupon_code') String? couponCode,
      @JsonKey(name: 'coupon_data') String? couponData,
      @JsonKey(name: 'coupon_amount') double couponAmount,
      @JsonKey(name: 'coupon_type') String couponType,
      @JsonKey(name: 'coupon_cb_amount') double couponCbAmount,
      @JsonKey(name: 'sc_coupon_id') String? scCouponId,
      @JsonKey(name: 'sc_coupon_amount') double scCouponAmount,
      @JsonKey(name: 'sc_coupon_done') int scCouponDone,
      @JsonKey(name: 'cb_amount_done') String cbAmountDone,
      @JsonKey(name: 'wallet_paid') double walletPaid,
      @JsonKey(name: 'qris_coins_paid') double qrisCoinsPaid,
      @JsonKey(name: 'qris_coins_done') String qrisCoinsDone,
      @JsonKey(name: 'payment_respons') String? paymentRespons,
      @JsonKey(name: 'product_record') String? productRecord,
      @JsonKey(name: 'booking_slot_date') String bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') String? bookingSlotTime,
      @JsonKey(name: 'booking_pin') String bookingPin,
      @JsonKey(name: 'booking_address') String bookingAddress,
      @JsonKey(name: 'sample_type') String sampleType,
      @JsonKey(name: 'tube_type') String tubeType,
      @JsonKey(name: 'hard_copy') String hardCopy,
      @JsonKey(name: 'agent_id') int agentId,
      @JsonKey(name: 'agent_discount_amt') double agentDiscountAmt,
      @JsonKey(name: 'headoffice_collection') String headofficeCollection,
      @JsonKey(name: 'referred_by') String referredBy,
      @JsonKey(name: 'doctor_booking_slot_time') String? doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address') String doctorBookingAddress,
      String invoice});
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
    Object? doctorId = null,
    Object? orderDate = null,
    Object? orderTotal = null,
    Object? collectionCharge = null,
    Object? paidAmount = null,
    Object? orderStatus = null,
    Object? paymentMode = null,
    Object? txnId = freezed,
    Object? bnkTxnId = freezed,
    Object? razorOrderId = null,
    Object? couponCode = freezed,
    Object? couponData = freezed,
    Object? couponAmount = null,
    Object? couponType = null,
    Object? couponCbAmount = null,
    Object? scCouponId = freezed,
    Object? scCouponAmount = null,
    Object? scCouponDone = null,
    Object? cbAmountDone = null,
    Object? walletPaid = null,
    Object? qrisCoinsPaid = null,
    Object? qrisCoinsDone = null,
    Object? paymentRespons = freezed,
    Object? productRecord = freezed,
    Object? bookingSlotDate = null,
    Object? bookingSlotTime = freezed,
    Object? bookingPin = null,
    Object? bookingAddress = null,
    Object? sampleType = null,
    Object? tubeType = null,
    Object? hardCopy = null,
    Object? agentId = null,
    Object? agentDiscountAmt = null,
    Object? headofficeCollection = null,
    Object? referredBy = null,
    Object? doctorBookingSlotTime = freezed,
    Object? doctorBookingAddress = null,
    Object? invoice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
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
      bnkTxnId: freezed == bnkTxnId
          ? _value.bnkTxnId
          : bnkTxnId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorOrderId: null == razorOrderId
          ? _value.razorOrderId
          : razorOrderId // ignore: cast_nullable_to_non_nullable
              as String,
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
      couponType: null == couponType
          ? _value.couponType
          : couponType // ignore: cast_nullable_to_non_nullable
              as String,
      couponCbAmount: null == couponCbAmount
          ? _value.couponCbAmount
          : couponCbAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scCouponId: freezed == scCouponId
          ? _value.scCouponId
          : scCouponId // ignore: cast_nullable_to_non_nullable
              as String?,
      scCouponAmount: null == scCouponAmount
          ? _value.scCouponAmount
          : scCouponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scCouponDone: null == scCouponDone
          ? _value.scCouponDone
          : scCouponDone // ignore: cast_nullable_to_non_nullable
              as int,
      cbAmountDone: null == cbAmountDone
          ? _value.cbAmountDone
          : cbAmountDone // ignore: cast_nullable_to_non_nullable
              as String,
      walletPaid: null == walletPaid
          ? _value.walletPaid
          : walletPaid // ignore: cast_nullable_to_non_nullable
              as double,
      qrisCoinsPaid: null == qrisCoinsPaid
          ? _value.qrisCoinsPaid
          : qrisCoinsPaid // ignore: cast_nullable_to_non_nullable
              as double,
      qrisCoinsDone: null == qrisCoinsDone
          ? _value.qrisCoinsDone
          : qrisCoinsDone // ignore: cast_nullable_to_non_nullable
              as String,
      paymentRespons: freezed == paymentRespons
          ? _value.paymentRespons
          : paymentRespons // ignore: cast_nullable_to_non_nullable
              as String?,
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
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as int,
      agentDiscountAmt: null == agentDiscountAmt
          ? _value.agentDiscountAmt
          : agentDiscountAmt // ignore: cast_nullable_to_non_nullable
              as double,
      headofficeCollection: null == headofficeCollection
          ? _value.headofficeCollection
          : headofficeCollection // ignore: cast_nullable_to_non_nullable
              as String,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
      doctorBookingSlotTime: freezed == doctorBookingSlotTime
          ? _value.doctorBookingSlotTime
          : doctorBookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorBookingAddress: null == doctorBookingAddress
          ? _value.doctorBookingAddress
          : doctorBookingAddress // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'order_total') double orderTotal,
      @JsonKey(name: 'collection_charge') String collectionCharge,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'order_status') OrderStatus orderStatus,
      @JsonKey(name: 'payment_mode') String paymentMode,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'bnk_txn_id') String? bnkTxnId,
      @JsonKey(name: 'razor_order_id') String razorOrderId,
      @JsonKey(name: 'coupon_code') String? couponCode,
      @JsonKey(name: 'coupon_data') String? couponData,
      @JsonKey(name: 'coupon_amount') double couponAmount,
      @JsonKey(name: 'coupon_type') String couponType,
      @JsonKey(name: 'coupon_cb_amount') double couponCbAmount,
      @JsonKey(name: 'sc_coupon_id') String? scCouponId,
      @JsonKey(name: 'sc_coupon_amount') double scCouponAmount,
      @JsonKey(name: 'sc_coupon_done') int scCouponDone,
      @JsonKey(name: 'cb_amount_done') String cbAmountDone,
      @JsonKey(name: 'wallet_paid') double walletPaid,
      @JsonKey(name: 'qris_coins_paid') double qrisCoinsPaid,
      @JsonKey(name: 'qris_coins_done') String qrisCoinsDone,
      @JsonKey(name: 'payment_respons') String? paymentRespons,
      @JsonKey(name: 'product_record') String? productRecord,
      @JsonKey(name: 'booking_slot_date') String bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') String? bookingSlotTime,
      @JsonKey(name: 'booking_pin') String bookingPin,
      @JsonKey(name: 'booking_address') String bookingAddress,
      @JsonKey(name: 'sample_type') String sampleType,
      @JsonKey(name: 'tube_type') String tubeType,
      @JsonKey(name: 'hard_copy') String hardCopy,
      @JsonKey(name: 'agent_id') int agentId,
      @JsonKey(name: 'agent_discount_amt') double agentDiscountAmt,
      @JsonKey(name: 'headoffice_collection') String headofficeCollection,
      @JsonKey(name: 'referred_by') String referredBy,
      @JsonKey(name: 'doctor_booking_slot_time') String? doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address') String doctorBookingAddress,
      String invoice});
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
    Object? doctorId = null,
    Object? orderDate = null,
    Object? orderTotal = null,
    Object? collectionCharge = null,
    Object? paidAmount = null,
    Object? orderStatus = null,
    Object? paymentMode = null,
    Object? txnId = freezed,
    Object? bnkTxnId = freezed,
    Object? razorOrderId = null,
    Object? couponCode = freezed,
    Object? couponData = freezed,
    Object? couponAmount = null,
    Object? couponType = null,
    Object? couponCbAmount = null,
    Object? scCouponId = freezed,
    Object? scCouponAmount = null,
    Object? scCouponDone = null,
    Object? cbAmountDone = null,
    Object? walletPaid = null,
    Object? qrisCoinsPaid = null,
    Object? qrisCoinsDone = null,
    Object? paymentRespons = freezed,
    Object? productRecord = freezed,
    Object? bookingSlotDate = null,
    Object? bookingSlotTime = freezed,
    Object? bookingPin = null,
    Object? bookingAddress = null,
    Object? sampleType = null,
    Object? tubeType = null,
    Object? hardCopy = null,
    Object? agentId = null,
    Object? agentDiscountAmt = null,
    Object? headofficeCollection = null,
    Object? referredBy = null,
    Object? doctorBookingSlotTime = freezed,
    Object? doctorBookingAddress = null,
    Object? invoice = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
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
      bnkTxnId: freezed == bnkTxnId
          ? _value.bnkTxnId
          : bnkTxnId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorOrderId: null == razorOrderId
          ? _value.razorOrderId
          : razorOrderId // ignore: cast_nullable_to_non_nullable
              as String,
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
      couponType: null == couponType
          ? _value.couponType
          : couponType // ignore: cast_nullable_to_non_nullable
              as String,
      couponCbAmount: null == couponCbAmount
          ? _value.couponCbAmount
          : couponCbAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scCouponId: freezed == scCouponId
          ? _value.scCouponId
          : scCouponId // ignore: cast_nullable_to_non_nullable
              as String?,
      scCouponAmount: null == scCouponAmount
          ? _value.scCouponAmount
          : scCouponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scCouponDone: null == scCouponDone
          ? _value.scCouponDone
          : scCouponDone // ignore: cast_nullable_to_non_nullable
              as int,
      cbAmountDone: null == cbAmountDone
          ? _value.cbAmountDone
          : cbAmountDone // ignore: cast_nullable_to_non_nullable
              as String,
      walletPaid: null == walletPaid
          ? _value.walletPaid
          : walletPaid // ignore: cast_nullable_to_non_nullable
              as double,
      qrisCoinsPaid: null == qrisCoinsPaid
          ? _value.qrisCoinsPaid
          : qrisCoinsPaid // ignore: cast_nullable_to_non_nullable
              as double,
      qrisCoinsDone: null == qrisCoinsDone
          ? _value.qrisCoinsDone
          : qrisCoinsDone // ignore: cast_nullable_to_non_nullable
              as String,
      paymentRespons: freezed == paymentRespons
          ? _value.paymentRespons
          : paymentRespons // ignore: cast_nullable_to_non_nullable
              as String?,
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
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as int,
      agentDiscountAmt: null == agentDiscountAmt
          ? _value.agentDiscountAmt
          : agentDiscountAmt // ignore: cast_nullable_to_non_nullable
              as double,
      headofficeCollection: null == headofficeCollection
          ? _value.headofficeCollection
          : headofficeCollection // ignore: cast_nullable_to_non_nullable
              as String,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
      doctorBookingSlotTime: freezed == doctorBookingSlotTime
          ? _value.doctorBookingSlotTime
          : doctorBookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorBookingAddress: null == doctorBookingAddress
          ? _value.doctorBookingAddress
          : doctorBookingAddress // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: 'doctor_id') required this.doctorId,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'order_total') required this.orderTotal,
      @JsonKey(name: 'collection_charge') required this.collectionCharge,
      @JsonKey(name: 'paid_amount') required this.paidAmount,
      @JsonKey(name: 'order_status') required this.orderStatus,
      @JsonKey(name: 'payment_mode') required this.paymentMode,
      @JsonKey(name: 'txn_id') this.txnId,
      @JsonKey(name: 'bnk_txn_id') this.bnkTxnId,
      @JsonKey(name: 'razor_order_id') required this.razorOrderId,
      @JsonKey(name: 'coupon_code') this.couponCode,
      @JsonKey(name: 'coupon_data') this.couponData,
      @JsonKey(name: 'coupon_amount') required this.couponAmount,
      @JsonKey(name: 'coupon_type') required this.couponType,
      @JsonKey(name: 'coupon_cb_amount') required this.couponCbAmount,
      @JsonKey(name: 'sc_coupon_id') this.scCouponId,
      @JsonKey(name: 'sc_coupon_amount') required this.scCouponAmount,
      @JsonKey(name: 'sc_coupon_done') required this.scCouponDone,
      @JsonKey(name: 'cb_amount_done') required this.cbAmountDone,
      @JsonKey(name: 'wallet_paid') required this.walletPaid,
      @JsonKey(name: 'qris_coins_paid') required this.qrisCoinsPaid,
      @JsonKey(name: 'qris_coins_done') required this.qrisCoinsDone,
      @JsonKey(name: 'payment_respons') this.paymentRespons,
      @JsonKey(name: 'product_record') this.productRecord,
      @JsonKey(name: 'booking_slot_date') required this.bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') this.bookingSlotTime,
      @JsonKey(name: 'booking_pin') required this.bookingPin,
      @JsonKey(name: 'booking_address') required this.bookingAddress,
      @JsonKey(name: 'sample_type') required this.sampleType,
      @JsonKey(name: 'tube_type') required this.tubeType,
      @JsonKey(name: 'hard_copy') required this.hardCopy,
      @JsonKey(name: 'agent_id') required this.agentId,
      @JsonKey(name: 'agent_discount_amt') required this.agentDiscountAmt,
      @JsonKey(name: 'headoffice_collection')
      required this.headofficeCollection,
      @JsonKey(name: 'referred_by') required this.referredBy,
      @JsonKey(name: 'doctor_booking_slot_time') this.doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address')
      required this.doctorBookingAddress,
      required this.invoice});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
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
  @JsonKey(name: 'bnk_txn_id')
  final String? bnkTxnId;
  @override
  @JsonKey(name: 'razor_order_id')
  final String razorOrderId;
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
  @JsonKey(name: 'coupon_type')
  final String couponType;
  @override
  @JsonKey(name: 'coupon_cb_amount')
  final double couponCbAmount;
  @override
  @JsonKey(name: 'sc_coupon_id')
  final String? scCouponId;
  @override
  @JsonKey(name: 'sc_coupon_amount')
  final double scCouponAmount;
  @override
  @JsonKey(name: 'sc_coupon_done')
  final int scCouponDone;
  @override
  @JsonKey(name: 'cb_amount_done')
  final String cbAmountDone;
  @override
  @JsonKey(name: 'wallet_paid')
  final double walletPaid;
  @override
  @JsonKey(name: 'qris_coins_paid')
  final double qrisCoinsPaid;
  @override
  @JsonKey(name: 'qris_coins_done')
  final String qrisCoinsDone;
  @override
  @JsonKey(name: 'payment_respons')
  final String? paymentRespons;
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
  @JsonKey(name: 'agent_id')
  final int agentId;
  @override
  @JsonKey(name: 'agent_discount_amt')
  final double agentDiscountAmt;
  @override
  @JsonKey(name: 'headoffice_collection')
  final String headofficeCollection;
  @override
  @JsonKey(name: 'referred_by')
  final String referredBy;
  @override
  @JsonKey(name: 'doctor_booking_slot_time')
  final String? doctorBookingSlotTime;
  @override
  @JsonKey(name: 'doctor_booking_address')
  final String doctorBookingAddress;
  @override
  final String invoice;

  @override
  String toString() {
    return 'Order(id: $id, doctorId: $doctorId, orderDate: $orderDate, orderTotal: $orderTotal, collectionCharge: $collectionCharge, paidAmount: $paidAmount, orderStatus: $orderStatus, paymentMode: $paymentMode, txnId: $txnId, bnkTxnId: $bnkTxnId, razorOrderId: $razorOrderId, couponCode: $couponCode, couponData: $couponData, couponAmount: $couponAmount, couponType: $couponType, couponCbAmount: $couponCbAmount, scCouponId: $scCouponId, scCouponAmount: $scCouponAmount, scCouponDone: $scCouponDone, cbAmountDone: $cbAmountDone, walletPaid: $walletPaid, qrisCoinsPaid: $qrisCoinsPaid, qrisCoinsDone: $qrisCoinsDone, paymentRespons: $paymentRespons, productRecord: $productRecord, bookingSlotDate: $bookingSlotDate, bookingSlotTime: $bookingSlotTime, bookingPin: $bookingPin, bookingAddress: $bookingAddress, sampleType: $sampleType, tubeType: $tubeType, hardCopy: $hardCopy, agentId: $agentId, agentDiscountAmt: $agentDiscountAmt, headofficeCollection: $headofficeCollection, referredBy: $referredBy, doctorBookingSlotTime: $doctorBookingSlotTime, doctorBookingAddress: $doctorBookingAddress, invoice: $invoice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
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
            (identical(other.bnkTxnId, bnkTxnId) ||
                other.bnkTxnId == bnkTxnId) &&
            (identical(other.razorOrderId, razorOrderId) ||
                other.razorOrderId == razorOrderId) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.couponData, couponData) ||
                other.couponData == couponData) &&
            (identical(other.couponAmount, couponAmount) ||
                other.couponAmount == couponAmount) &&
            (identical(other.couponType, couponType) ||
                other.couponType == couponType) &&
            (identical(other.couponCbAmount, couponCbAmount) ||
                other.couponCbAmount == couponCbAmount) &&
            (identical(other.scCouponId, scCouponId) ||
                other.scCouponId == scCouponId) &&
            (identical(other.scCouponAmount, scCouponAmount) ||
                other.scCouponAmount == scCouponAmount) &&
            (identical(other.scCouponDone, scCouponDone) ||
                other.scCouponDone == scCouponDone) &&
            (identical(other.cbAmountDone, cbAmountDone) ||
                other.cbAmountDone == cbAmountDone) &&
            (identical(other.walletPaid, walletPaid) ||
                other.walletPaid == walletPaid) &&
            (identical(other.qrisCoinsPaid, qrisCoinsPaid) ||
                other.qrisCoinsPaid == qrisCoinsPaid) &&
            (identical(other.qrisCoinsDone, qrisCoinsDone) ||
                other.qrisCoinsDone == qrisCoinsDone) &&
            (identical(other.paymentRespons, paymentRespons) ||
                other.paymentRespons == paymentRespons) &&
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
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.agentDiscountAmt, agentDiscountAmt) ||
                other.agentDiscountAmt == agentDiscountAmt) &&
            (identical(other.headofficeCollection, headofficeCollection) ||
                other.headofficeCollection == headofficeCollection) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.doctorBookingSlotTime, doctorBookingSlotTime) ||
                other.doctorBookingSlotTime == doctorBookingSlotTime) &&
            (identical(other.doctorBookingAddress, doctorBookingAddress) ||
                other.doctorBookingAddress == doctorBookingAddress) &&
            (identical(other.invoice, invoice) || other.invoice == invoice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        doctorId,
        orderDate,
        orderTotal,
        collectionCharge,
        paidAmount,
        orderStatus,
        paymentMode,
        txnId,
        bnkTxnId,
        razorOrderId,
        couponCode,
        couponData,
        couponAmount,
        couponType,
        couponCbAmount,
        scCouponId,
        scCouponAmount,
        scCouponDone,
        cbAmountDone,
        walletPaid,
        qrisCoinsPaid,
        qrisCoinsDone,
        paymentRespons,
        productRecord,
        bookingSlotDate,
        bookingSlotTime,
        bookingPin,
        bookingAddress,
        sampleType,
        tubeType,
        hardCopy,
        agentId,
        agentDiscountAmt,
        headofficeCollection,
        referredBy,
        doctorBookingSlotTime,
        doctorBookingAddress,
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
      @JsonKey(name: 'doctor_id') required final String doctorId,
      @JsonKey(name: 'order_date') required final DateTime orderDate,
      @JsonKey(name: 'order_total') required final double orderTotal,
      @JsonKey(name: 'collection_charge')
      required final String collectionCharge,
      @JsonKey(name: 'paid_amount') required final double paidAmount,
      @JsonKey(name: 'order_status') required final OrderStatus orderStatus,
      @JsonKey(name: 'payment_mode') required final String paymentMode,
      @JsonKey(name: 'txn_id') final String? txnId,
      @JsonKey(name: 'bnk_txn_id') final String? bnkTxnId,
      @JsonKey(name: 'razor_order_id') required final String razorOrderId,
      @JsonKey(name: 'coupon_code') final String? couponCode,
      @JsonKey(name: 'coupon_data') final String? couponData,
      @JsonKey(name: 'coupon_amount') required final double couponAmount,
      @JsonKey(name: 'coupon_type') required final String couponType,
      @JsonKey(name: 'coupon_cb_amount') required final double couponCbAmount,
      @JsonKey(name: 'sc_coupon_id') final String? scCouponId,
      @JsonKey(name: 'sc_coupon_amount') required final double scCouponAmount,
      @JsonKey(name: 'sc_coupon_done') required final int scCouponDone,
      @JsonKey(name: 'cb_amount_done') required final String cbAmountDone,
      @JsonKey(name: 'wallet_paid') required final double walletPaid,
      @JsonKey(name: 'qris_coins_paid') required final double qrisCoinsPaid,
      @JsonKey(name: 'qris_coins_done') required final String qrisCoinsDone,
      @JsonKey(name: 'payment_respons') final String? paymentRespons,
      @JsonKey(name: 'product_record') final String? productRecord,
      @JsonKey(name: 'booking_slot_date') required final String bookingSlotDate,
      @JsonKey(name: 'booking_slot_time') final String? bookingSlotTime,
      @JsonKey(name: 'booking_pin') required final String bookingPin,
      @JsonKey(name: 'booking_address') required final String bookingAddress,
      @JsonKey(name: 'sample_type') required final String sampleType,
      @JsonKey(name: 'tube_type') required final String tubeType,
      @JsonKey(name: 'hard_copy') required final String hardCopy,
      @JsonKey(name: 'agent_id') required final int agentId,
      @JsonKey(name: 'agent_discount_amt')
      required final double agentDiscountAmt,
      @JsonKey(name: 'headoffice_collection')
      required final String headofficeCollection,
      @JsonKey(name: 'referred_by') required final String referredBy,
      @JsonKey(name: 'doctor_booking_slot_time')
      final String? doctorBookingSlotTime,
      @JsonKey(name: 'doctor_booking_address')
      required final String doctorBookingAddress,
      required final String invoice}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
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
  @JsonKey(name: 'bnk_txn_id')
  String? get bnkTxnId;
  @override
  @JsonKey(name: 'razor_order_id')
  String get razorOrderId;
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
  @JsonKey(name: 'coupon_type')
  String get couponType;
  @override
  @JsonKey(name: 'coupon_cb_amount')
  double get couponCbAmount;
  @override
  @JsonKey(name: 'sc_coupon_id')
  String? get scCouponId;
  @override
  @JsonKey(name: 'sc_coupon_amount')
  double get scCouponAmount;
  @override
  @JsonKey(name: 'sc_coupon_done')
  int get scCouponDone;
  @override
  @JsonKey(name: 'cb_amount_done')
  String get cbAmountDone;
  @override
  @JsonKey(name: 'wallet_paid')
  double get walletPaid;
  @override
  @JsonKey(name: 'qris_coins_paid')
  double get qrisCoinsPaid;
  @override
  @JsonKey(name: 'qris_coins_done')
  String get qrisCoinsDone;
  @override
  @JsonKey(name: 'payment_respons')
  String? get paymentRespons;
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
  @JsonKey(name: 'agent_id')
  int get agentId;
  @override
  @JsonKey(name: 'agent_discount_amt')
  double get agentDiscountAmt;
  @override
  @JsonKey(name: 'headoffice_collection')
  String get headofficeCollection;
  @override
  @JsonKey(name: 'referred_by')
  String get referredBy;
  @override
  @JsonKey(name: 'doctor_booking_slot_time')
  String? get doctorBookingSlotTime;
  @override
  @JsonKey(name: 'doctor_booking_address')
  String get doctorBookingAddress;
  @override
  String get invoice;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
