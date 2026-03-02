// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderReqModelImpl _$$OrderReqModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderReqModelImpl(
      userId: (json['userId'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String,
      packagesAmount: (json['packagesAmount'] as num?)?.toInt() ?? 0,
      collectionCharges: json['collectionCharges'] as String? ?? '0',
      cartFinalValue: (json['cartFinalValue'] as num?)?.toInt() ?? 0,
      paymentMode: $enumDecode(_$PaymentModeEnumMap, json['paymentMode']),
      razorpayPaymentId: json['razorpayPaymentId'] as String?,
      razorpayOrderId: json['razorpayOrderId'] as String?,
      razorpaySignature: json['razorpaySignature'] as String?,
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      redeemedWalletAmount:
          (json['redeemedWalletAmount'] as num?)?.toInt() ?? 0,
      redeemedQrisCoins: (json['redeemedQrisCoins'] as num?)?.toInt() ?? 0,
      paymentResponse: json['paymentResponse'] as String?,
      appliedCouponAmount: (json['appliedCouponAmount'] as num).toDouble(),
      encodedProductData: json['encodedProductData'] as String,
      slotDate: json['slotDate'] as String,
      slotTime: json['slotTime'] as String,
      pincode: json['pincode'] as String,
      encodedAddress: json['encodedAddress'] as String,
      wellnessAnswers: (json['wellnessAnswers'] as List<dynamic>?)
          ?.map((e) => WellnessAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      encodedCouponData: json['encodedCouponData'] as String?,
      sampleType: json['sampleType'] as String?,
      tubeType: json['tubeType'] as String?,
      hardCopyCharges: json['hardCopyCharges'] as String? ?? '0',
      referBy: json['referBy'] as String?,
    );

Map<String, dynamic> _$$OrderReqModelImplToJson(_$OrderReqModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'phoneNumber': instance.phoneNumber,
      'packagesAmount': instance.packagesAmount,
      'collectionCharges': instance.collectionCharges,
      'cartFinalValue': instance.cartFinalValue,
      'paymentMode': _$PaymentModeEnumMap[instance.paymentMode]!,
      'razorpayPaymentId': instance.razorpayPaymentId,
      'razorpayOrderId': instance.razorpayOrderId,
      'razorpaySignature': instance.razorpaySignature,
      'coupon': instance.coupon,
      'redeemedWalletAmount': instance.redeemedWalletAmount,
      'redeemedQrisCoins': instance.redeemedQrisCoins,
      'paymentResponse': instance.paymentResponse,
      'appliedCouponAmount': instance.appliedCouponAmount,
      'encodedProductData': instance.encodedProductData,
      'slotDate': instance.slotDate,
      'slotTime': instance.slotTime,
      'pincode': instance.pincode,
      'encodedAddress': instance.encodedAddress,
      'wellnessAnswers': instance.wellnessAnswers,
      'encodedCouponData': instance.encodedCouponData,
      'sampleType': instance.sampleType,
      'tubeType': instance.tubeType,
      'hardCopyCharges': instance.hardCopyCharges,
      'referBy': instance.referBy,
    };

const _$PaymentModeEnumMap = {
  PaymentMode.razorpay: 'razorpay',
  PaymentMode.cod: 'cod',
  PaymentMode.online: 'online',
  PaymentMode.prepaid: 'prepaid',
};
