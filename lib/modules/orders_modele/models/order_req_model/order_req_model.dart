import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/constants/enums/payment_mode.dart';
import 'package:qris_health/modules/health_module/models/wellness_answer/wellness_answer.dart';
import '../coupon/coupon.dart';

part 'order_req_model.freezed.dart';
part 'order_req_model.g.dart';

@freezed
class OrderReqModel with _$OrderReqModel {
  const factory OrderReqModel({
    required int userId,
    required String phoneNumber,
    @Default(0) int packagesAmount,
    @Default('0') String collectionCharges,
    @Default(0) int cartFinalValue,
    required PaymentMode paymentMode,

    // ✅ Razorpay fields added
    String? razorpayPaymentId,
    String? razorpayOrderId,
    String? razorpaySignature,

    Coupon? coupon,
    @Default(0) int redeemedWalletAmount,
    @Default(0) int redeemedQrisCoins,
    String? paymentResponse,
    required double appliedCouponAmount,
    required String encodedProductData,
    required String slotDate,
    required String slotTime,
    required String pincode,
    required String encodedAddress,
    List<WellnessAnswer>? wellnessAnswers,
    String? encodedCouponData,
    String? sampleType,
    String? tubeType,
    @Default('0') String hardCopyCharges,
    String? referBy,
  }) = _OrderReqModel;

  factory OrderReqModel.fromJson(Map<String, dynamic> json) =>
      _$OrderReqModelFromJson(json);
}
