import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/coupon_applicable_type.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/cart_module/components/coupon_applied_dialog.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/orders_modele/services/coupon_service.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/components/common_cross_icon.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../orders_modele/models/coupon/coupon.dart';
import 'coupon_list_tile.dart';

class CouponsBottomSheet extends StatefulWidget {
  const CouponsBottomSheet({super.key});

  @override
  State<CouponsBottomSheet> createState() => _CouponsBottomSheetState();
}

class _CouponsBottomSheetState extends State<CouponsBottomSheet> {
  final _searchController = TextEditingController();
  final _textTheme = Get.textTheme;
  late final Future<List<Coupon>> _couponsFuture;
  List<Coupon>? _coupons;

  @override
  void initState() {
    super.initState();
    _couponsFuture = CouponService.getAllCoupons();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetTemplate(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(height: 24),
      Row(children: [
        Text('Coupons',
            style: _textTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.w700, color: AppColors.black)),
        Spacer(),
        CommonCrossIcon(),
      ]),
      SizedBox(height: 16),
      SizedBox(
          height: 35,
          child: Row(children: [
            Expanded(
                child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: 'Enter coupon code',
                        hintStyle: _textTheme.bodySmall!.copyWith(
                            color: AppColors.lightSubTextColor,
                            fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:
                                BorderSide(color: AppColors.borderColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:
                                BorderSide(color: AppColors.borderColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:
                                BorderSide(color: AppColors.borderColor))))),
            SizedBox(width: 8),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.5),
                child: ElevatedButton(
                    onPressed: () async {
                      final searchedText =
                          _searchController.text.trim().toLowerCase();
                      if (searchedText.isEmpty) return;

                      final cartCubit = BlocProvider.of<CartCubit>(context);
                      final testValue = cartCubit.getCartTestPrices();

                      final coupon = _coupons?.firstWhereOrNull((c) =>
                          c.couponCode.toLowerCase() == searchedText);

                      if (coupon != null) {
                        if (testValue >= coupon.cartValue) {
                          await _applyCoupon(coupon: coupon);
                        } else {
                          AppConstants.showSnackbar(
                              text:
                                  'Your cart is ineligible to apply the searched coupon',
                              type: SnackbarType.error);
                        }
                      } else {
                        try {
                          final fetched =
                              await CouponService.getCouponByCouponCode(
                                  couponCode: _searchController.text.trim());
                          if (testValue < fetched.cartValue) {
                            AppConstants.showSnackbar(
                                text:
                                    'Your cart is ineligible to apply this coupon',
                                type: SnackbarType.error);
                            return;
                          }
                          await _applyCoupon(coupon: fetched);
                        } catch (e) {
                          AppConstants.showSnackbar(
                              text: e.toString(), type: SnackbarType.error);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    child: Text('    Apply    ',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.white))))
          ])),
      SizedBox(height: 24),
      Expanded(
          child: FutureBuilder<List<Coupon>>(
              future: _couponsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _coupons ??= snapshot.data!;

                  return BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final cartTestValue = BlocProvider.of<CartCubit>(context)
                          .getCartTestPrices();

                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final coupon = _coupons![index];

                            return CouponListTile(
                                onTap: cartTestValue < coupon.cartValue
                                    ? null
                                    : () => _applyCoupon(coupon: coupon),
                                coupon: coupon);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 12);
                          },
                          itemCount: _coupons!.length);
                    },
                  );
                }

                return CommonListviewShimmer();
              })),
      SizedBox(height: 16)
    ]));
  }

  Future<void> _applyCoupon({required Coupon coupon}) async {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    final userId = ApiParams.getInstance()!.userId!.toString();

    if (coupon.applicable == CouponApplicableType.web) {
      AppConstants.showSnackbar(
          text: 'Sorry! This coupon is applicable for website only',
          type: SnackbarType.error);
      return;
    }

    try {
      await cartCubit.applyCouponByCode(
        couponCode: coupon.couponCode,
        userId: userId,
        context: context,
      );
      if (!mounted) return;
      Navigator.of(context).pop();
      final applied = cartCubit.state.cart?.appliedCoupon;
      if (applied != null && mounted) {
        await showDialog<void>(
            context: context,
            builder: (ctx) => CouponAppliedDialog(appliedCoupon: applied));
      }
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }
}
