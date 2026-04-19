import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';
import 'package:qris_health/modules/cart_module/screens/cart_screen.dart';
import 'package:qris_health/modules/health_module/models/wellness_answer/wellness_answer.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';

import '../../all_scans_module/models/test_package_model/test_package_model.dart';

class CartHelper {
  static Future<void> addToCartAndNavigate(
      {required TestPackageModel testPackageModel,
      List<WellnessAnswer>? wellnessAnswers}) async {
    try {
      final context = Get.context!;
      final cartCubit = BlocProvider.of<CartCubit>(context);
      final fullTest =
          await TestService.getTestByTestId(id: testPackageModel.id);
      if (!context.mounted) return;
      await cartCubit.removeInvalidTestsFromCart();
      await cartCubit.addToCart(fullTest);
      await cartCubit.removeAppliedCouponAndCoins();
      if (!context.mounted) return;

      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => CartScreen(
              testPackageModel: testPackageModel,
              wellnessAnswers: wellnessAnswers)));
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }
}
