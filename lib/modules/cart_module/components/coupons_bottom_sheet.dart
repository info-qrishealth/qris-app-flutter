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
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/components/common_cross_icon.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';
import 'package:qris_health/shared/models/qris_config/qris_config.dart';
import 'package:qris_health/shared/services/config_services.dart';
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
  late QrisConfig _config;

  @override
  void initState() {
    super.initState();
    _couponsFuture = CouponService.getAllCoupons();
    _config = BlocProvider.of<QrisConfigCubit>(context).state.config!;
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
                      final searchedText = _searchController.text.toLowerCase();
                      final coupon = _coupons?.firstWhereOrNull((coupon) =>
                          coupon.couponCode.toLowerCase() == searchedText);
                      final testValue =
                          BlocProvider.of<CartCubit>(context).cartTestValue;

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
                          final coupon =
                              await CouponService.getCouponByCouponCode(
                                  couponCode: _searchController.text);
                          await _applyCoupon(coupon: coupon);
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
    try {
      final currentDateTime = await ConfigService.getCurrentServerTime();

      if (coupon.applicable == CouponApplicableType.web) {
        throw 'Sorry! This coupon is applicable for website only';
      }

      if (coupon.status != 1) {
        throw 'Sorry! This coupon is not active';
      }

      if (!(coupon.couponStartDate.isBefore(currentDateTime) &&
          coupon.couponEndDate.isAfter(currentDateTime))) {
        throw 'Sorry! This coupon is expired';
      }

      if (coupon.firstOrder == '1' ||
          coupon.oneTime == 1 ||
          coupon.for120days == '1') {
        final orders = await OrderService.getAllOrdersForUser(
            userId: ApiParams.getInstance()!.userId!.toString());

        if (orders.isNotEmpty && coupon.firstOrder == '1') {
          throw 'Sorry! This coupon is valid on first order only';
        }

        if (coupon.oneTime == 1 &&
            orders.firstWhereOrNull((order) =>
                    order.couponCode!.toLowerCase() ==
                    coupon.couponCode.toLowerCase()) !=
                null) {
          throw 'Sorry! You have already used this coupon code before. This coupon is for one time use only';
        }

        if (coupon.for120days == '1') {
          orders.sort((a, b) => b.orderDate.compareTo(a.orderDate));
          final latestOrder = orders.first;

          if (currentDateTime.difference(latestOrder.orderDate).inDays < 120) {
            throw 'Sorry! This coupon is not applicable for now';
          }
        }
      } else {
        await Future.delayed(Duration(milliseconds: 100));
      }

      Navigator.of(context).pop();
      BlocProvider.of<CartCubit>(context).applyCoupon(coupon: coupon);

      await showDialog(
          context: context,
          builder: (context) => CouponAppliedDialog(appliedCoupon: coupon));
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }
}
