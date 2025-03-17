// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderReqModelImpl _$$OrderReqModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderReqModelImpl(
      userId: (json['userId'] as num?)?.toInt(),
      packagesAmount: (json['packagesAmount'] as num?)?.toInt() ?? 0,
      collectionCharges: (json['collectionCharges'] as num?)?.toInt(),
      cartFinalValue: (json['cartFinalValue'] as num?)?.toInt() ?? 0,
      paymentMode:
          $enumDecodeNullable(_$PaymentModeEnumMap, json['paymentMode']),
      razorpayPaymentId: json['razorpayPaymentId'] as String?,
      razorpayOrderId: json['razorpayOrderId'] as String?,
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      redeemedWalletAmount:
          (json['redeemedWalletAmount'] as num?)?.toInt() ?? 0,
      redeemedQrisCoins: (json['redeemedQrisCoins'] as num?)?.toInt() ?? 0,
      paymentResponse: json['paymentResponse'] as String?,
      product: json['product'] as String?,
      slotDate: json['slotDate'] as String?,
      slotTime: json['slotTime'] as String?,
      pincode: json['pincode'] as String?,
      address: json['address'] as String?,
      sampleType: json['sampleType'] as String?,
      hardCopyCharges: json['hardCopyCharges'] as String? ?? '0',
      referBy: json['referBy'] as String?,
    );

Map<String, dynamic> _$$OrderReqModelImplToJson(_$OrderReqModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'packagesAmount': instance.packagesAmount,
      'collectionCharges': instance.collectionCharges,
      'cartFinalValue': instance.cartFinalValue,
      'paymentMode': _$PaymentModeEnumMap[instance.paymentMode],
      'razorpayPaymentId': instance.razorpayPaymentId,
      'razorpayOrderId': instance.razorpayOrderId,
      'coupon': instance.coupon,
      'redeemedWalletAmount': instance.redeemedWalletAmount,
      'redeemedQrisCoins': instance.redeemedQrisCoins,
      'paymentResponse': instance.paymentResponse,
      'product': instance.product,
      'slotDate': instance.slotDate,
      'slotTime': instance.slotTime,
      'pincode': instance.pincode,
      'address': instance.address,
      'sampleType': instance.sampleType,
      'hardCopyCharges': instance.hardCopyCharges,
      'referBy': instance.referBy,
    };

const _$PaymentModeEnumMap = {
  PaymentMode.razorpay: 'razorpay',
  PaymentMode.cod: 'cod',
  PaymentMode.online: 'online',
  PaymentMode.prePaid: 'prePaid',
};
