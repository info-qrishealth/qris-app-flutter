import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/constants/enums/order_status.dart';
import '../../../../constants/enums/payment_mode.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    @JsonKey(name: 'order_date') required DateTime orderDate,
    @JsonKey(name: 'order_total') required double orderTotal,
    @JsonKey(name: 'collection_charge') required String collectionCharge,
    @JsonKey(name: 'paid_amount') required double paidAmount,
    @JsonKey(name: 'order_status') required OrderStatus orderStatus,
    @JsonKey(
      name: 'payment_mode',
      /*fromJson: PaymentModeExtension.fromString,
        toJson: paymentModeToJson*/
    )
    required String paymentMode,
    @JsonKey(name: 'txn_id') String? txnId,
    @JsonKey(name: 'coupon_code') String? couponCode,
    @JsonKey(name: 'coupon_data') String? couponData,
    @JsonKey(name: 'coupon_amount') required double couponAmount,
    @JsonKey(name: 'coupon_cb_amount') required double couponCbAmount,
    @JsonKey(name: 'sc_coupon_amount') required double scCouponAmount,
    @JsonKey(name: 'wallet_paid') required double walletPaid,
    @JsonKey(name: 'qris_coins_paid') required double qrisCoinsPaid,
    @JsonKey(name: 'product_record') String? productRecord,
    @JsonKey(name: 'booking_slot_date') required String bookingSlotDate,
    @JsonKey(name: 'booking_slot_time') String? bookingSlotTime,
    @JsonKey(name: 'booking_pin') required String bookingPin,
    @JsonKey(name: 'booking_address') required String bookingAddress,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'tube_type') required String tubeType,
    @JsonKey(name: 'hard_copy') required String hardCopy,
    @JsonKey(name: 'referred_by') required String referredBy,
    @JsonKey(name: 'doctor_booking_slot_time') String? doctorBookingSlotTime,
    @JsonKey(name: 'doctor_booking_address')
    required String invoice,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

String paymentModeToJson(PaymentMode mode) => mode.value;
