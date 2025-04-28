// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num).toInt(),
      orderDate: DateTime.parse(json['order_date'] as String),
      orderTotal: (json['order_total'] as num).toDouble(),
      collectionCharge: json['collection_charge'] as String,
      paidAmount: (json['paid_amount'] as num).toDouble(),
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['order_status']),
      paymentMode: json['payment_mode'] as String,
      txnId: json['txn_id'] as String?,
      couponCode: json['coupon_code'] as String?,
      couponData: json['coupon_data'] as String?,
      couponAmount: (json['coupon_amount'] as num?)?.toDouble(),
      couponCbAmount: (json['coupon_cb_amount'] as num?)?.toDouble(),
      scCouponAmount: (json['sc_coupon_amount'] as num?)?.toDouble(),
      walletPaid: (json['wallet_paid'] as num?)?.toDouble(),
      qrisCoinsPaid: (json['qris_coins_paid'] as num?)?.toDouble(),
      productRecord: json['product_record'] as String?,
      bookingSlotDate: json['booking_slot_date'] as String?,
      bookingSlotTime: json['booking_slot_time'] as String?,
      bookingPin: json['booking_pin'] as String?,
      bookingAddress: json['booking_address'] as String?,
      sampleType: json['sample_type'] as String?,
      tubeType: json['tube_type'] as String?,
      hardCopy: json['hard_copy'] as String?,
      referredBy: json['referred_by'] as String?,
      invoice: json['doctor_booking_address'] as String?,
      isCancellationProcessed: json['is_cancellation_processed'] as bool?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_date': instance.orderDate.toIso8601String(),
      'order_total': instance.orderTotal,
      'collection_charge': instance.collectionCharge,
      'paid_amount': instance.paidAmount,
      'order_status': _$OrderStatusEnumMap[instance.orderStatus]!,
      'payment_mode': instance.paymentMode,
      'txn_id': instance.txnId,
      'coupon_code': instance.couponCode,
      'coupon_data': instance.couponData,
      'coupon_amount': instance.couponAmount,
      'coupon_cb_amount': instance.couponCbAmount,
      'sc_coupon_amount': instance.scCouponAmount,
      'wallet_paid': instance.walletPaid,
      'qris_coins_paid': instance.qrisCoinsPaid,
      'product_record': instance.productRecord,
      'booking_slot_date': instance.bookingSlotDate,
      'booking_slot_time': instance.bookingSlotTime,
      'booking_pin': instance.bookingPin,
      'booking_address': instance.bookingAddress,
      'sample_type': instance.sampleType,
      'tube_type': instance.tubeType,
      'hard_copy': instance.hardCopy,
      'referred_by': instance.referredBy,
      'doctor_booking_address': instance.invoice,
      'is_cancellation_processed': instance.isCancellationProcessed,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.success: 'success',
  OrderStatus.complete: 'complete',
  OrderStatus.cancel: 'cancel',
};
