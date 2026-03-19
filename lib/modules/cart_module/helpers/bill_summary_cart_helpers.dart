import 'package:flutter/material.dart';

import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/address_module/models/pincode/pincode.dart';

/// Cart-related helpers for the bill summary tab. No business logic or calculations.
/// Keeps BillSummaryTab build method focused on UI.

/// Updates cart pincode only when the selected pincode value actually changed,
/// to avoid clearing cart summary on every build.
void syncPincodeIfNeeded({
  required CartCubit cartCubit,
  required CartState state,
  required Pincode? pincode,
}) {
  if (pincode == null) return;
  if (state.cart.pincode == null || state.cart.pincode!.pincode != pincode.pincode) {
    cartCubit.updateCollectionPincode(pincode);
  }
}

/// Schedules a post-frame callback to load cart summary from backend when
/// summary is missing and cart has items and pincode. Call from build when
/// you have wallet/coins and userId.
void scheduleLoadCartSummaryIfNeeded({
  required BuildContext context,
  required CartState state,
  required CartCubit cartCubit,
  required String? userId,
  required double totalWalletAmount,
  required int totalQrisCoins,
  required Pincode? pincode,
}) {
  if (state.cartSummary != null) return;
  if (state.cart.cartTests.isEmpty || pincode == null || userId == null) return;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (context.mounted) {
      cartCubit.loadCartSummary(
        userId: userId!,
        totalWalletAmount: totalWalletAmount,
        totalQrisCoins: totalQrisCoins,
      );
    }
  });
}
