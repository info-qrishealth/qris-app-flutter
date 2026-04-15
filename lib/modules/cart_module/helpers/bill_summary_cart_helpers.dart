import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/address_module/models/pincode/pincode.dart';


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

