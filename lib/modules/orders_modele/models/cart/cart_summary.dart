/// All cart calculations are done on the server; this holds the result.
class CartSummary {
  final double cartTestPrices;
  final double baseCartValue;
  final int deliveryCharge;
  final int hardCopyCharges;
  final double cartFinalValue;
  final int walletRedeemedAmount;
  final double? appliedCouponAmount;
  final int redeemedQrisCoins;
  final String sampleType;
  final String tubeType;

  final double availableWalletBalance;
  final double availableQrisCoins;

  const CartSummary({
    required this.cartTestPrices,
    required this.baseCartValue,
    required this.deliveryCharge,
    required this.hardCopyCharges,
    required this.cartFinalValue,
    required this.walletRedeemedAmount,
    this.appliedCouponAmount,
    required this.redeemedQrisCoins,
    required this.sampleType,
    required this.tubeType,
    this.availableWalletBalance = 0,
    this.availableQrisCoins = 0,
  });

  factory CartSummary.fromJson(Map<String, dynamic> json) {
    return CartSummary(
      cartTestPrices: (json['cartTestPrices'] as num?)?.toDouble() ?? 0,
      baseCartValue: (json['baseCartValue'] as num?)?.toDouble() ?? 0,
      deliveryCharge: (json['deliveryCharge'] as num?)?.toInt() ?? 0,
      hardCopyCharges: (json['hardCopyCharges'] as num?)?.toInt() ?? 0,
      cartFinalValue: (json['cartFinalValue'] as num?)?.toDouble() ?? 0,
      walletRedeemedAmount: (json['walletRedeemedAmount'] as num?)?.toInt() ?? 0,
      appliedCouponAmount: (json['appliedCouponAmount'] as num?)?.toDouble(),
      redeemedQrisCoins: (json['redeemedQrisCoins'] as num?)?.toInt() ?? 0,
      sampleType: json['sampleType'] as String? ?? '',
      tubeType: json['tubeType'] as String? ?? '',
      availableWalletBalance:
          (json['availableWalletBalance'] as num?)?.toDouble() ?? 0,
      availableQrisCoins:
          (json['availableQrisCoins'] as num?)?.toDouble() ?? 0,
    );
  }
}
