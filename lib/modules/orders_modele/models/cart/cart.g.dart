// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      userId: (json['userId'] as num?)?.toInt(),
      cartTests: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      collectionDate: json['collectionDate'] == null
          ? null
          : DateTime.parse(json['collectionDate'] as String),
      shouldGetHardCopy: json['hardCopy'] as bool?,
      redeemCoins: json['redeemCoins'] as bool?,
      selectedAddress: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      timeSlot: json['slot'] == null
          ? null
          : TimeSlot.fromJson(json['slot'] as Map<String, dynamic>),
      appliedCoupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      cartTestPrices: (json['cartTestPrices'] as num?)?.toInt(),
      baseCartValue: (json['baseCartValue'] as num?)?.toInt(),
      deliveryCharge: (json['deliveryCharge'] as num?)?.toInt(),
      hardCopyCharges: (json['hardCopyCharges'] as num?)?.toInt(),
      cartFinalValue: (json['cartFinalValue'] as num?)?.toInt(),
      walletRedeemedAmount: (json['walletRedeemedAmount'] as num?)?.toInt(),
      appliedCouponAmount: (json['appliedCouponAmount'] as num?)?.toInt(),
      redeemedQrisCoins: (json['redeemedQrisCoins'] as num?)?.toInt(),
      sampleType: json['sampleType'] as String?,
      tubeType: json['tubeType'] as String?,
      totalCartValue: (json['totalCartValue'] as num?)?.toInt(),
      collectionCharge: (json['collectionCharge'] as num?)?.toInt(),
      availableWalletBalance: (json['availableWalletBalance'] as num?)?.toInt(),
      availableQrisCoins: (json['availableQrisCoins'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'items': instance.cartTests,
      'collectionDate': instance.collectionDate?.toIso8601String(),
      'hardCopy': instance.shouldGetHardCopy,
      'redeemCoins': instance.redeemCoins,
      'address': instance.selectedAddress,
      'slot': instance.timeSlot,
      'coupon': instance.appliedCoupon,
      'cartTestPrices': instance.cartTestPrices,
      'baseCartValue': instance.baseCartValue,
      'deliveryCharge': instance.deliveryCharge,
      'hardCopyCharges': instance.hardCopyCharges,
      'cartFinalValue': instance.cartFinalValue,
      'walletRedeemedAmount': instance.walletRedeemedAmount,
      'appliedCouponAmount': instance.appliedCouponAmount,
      'redeemedQrisCoins': instance.redeemedQrisCoins,
      'sampleType': instance.sampleType,
      'tubeType': instance.tubeType,
      'totalCartValue': instance.totalCartValue,
      'collectionCharge': instance.collectionCharge,
      'availableWalletBalance': instance.availableWalletBalance,
      'availableQrisCoins': instance.availableQrisCoins,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      testId: (json['testId'] as num?)?.toInt(),
      patientIds: (json['patientIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      test: json['test'] == null
          ? null
          : TestPackageModel.fromJson(json['test'] as Map<String, dynamic>),
      patients: (json['patients'] as List<dynamic>?)
              ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'patientIds': instance.patientIds,
      'test': instance.test,
      'patients': instance.patients,
    };
