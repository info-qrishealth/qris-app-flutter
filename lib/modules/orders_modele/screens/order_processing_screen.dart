import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/orders_modele/models/order/order.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/enums/snackbar_type.dart';
import '../../home_module/screens/home_screen.dart';
import '../../orders_modele/cart_cubit/cart_cubit.dart';
import '../../refer_and_earn_module/cubits/qris_coin_cubit/qris_coins_cubit.dart';
import '../../refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';
import '../services/order_service.dart';

class OrderProcessingBottomSheet extends StatefulWidget {
  final Map<String, dynamic> payload;

  const OrderProcessingBottomSheet({super.key, required this.payload});

  @override
  _OrderProcessingBottomSheetState createState() =>
      _OrderProcessingBottomSheetState();
}

class _OrderProcessingBottomSheetState
    extends State<OrderProcessingBottomSheet> {
  Order? _order;
  int _redirectingSeconds = 3;
  Timer? _redirectTimer;

  Future<void> _syncCartAfterOrder(CartCubit cartCubit) async {
    // Backend clears cart post-order
    for (var i = 0; i < 3; i++) {
      await cartCubit.refreshCartFromServer();
      if (cartCubit.state.cart.cartTests.isEmpty) {
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () async {
  //     try {
  //       _order =
  //           await OrderService.createOrder(orderReqModel: widget.orderReqModel);

  //       BlocProvider.of<QrisCoinsCubit>(context).getQrisCoins();
  //       BlocProvider.of<QrisWalletCubit>(context).getWalletEntries();

  //       Timer.periodic(Duration(seconds: 1), (timer) {
  //         setState(() {
  //           _redirectingSeconds--;
  //         });

  //         if (_redirectingSeconds == 0) {
  //           Navigator.of(context).pushAndRemoveUntil(
  //               CupertinoPageRoute(builder: (context) => HomeScreen()),
  //               (route) => false);
  //           timer.cancel();
  //         }
  //       });

  //       setState(() {});
  //     } catch (e) {
  //       Navigator.of(context).pop();
  //       AppConstants.showSnackbar(
  //           text:
  //               'There is some error while creating order. Please contact Qris support for better guidance',
  //           type: SnackbarType.error);
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final qrisCoinsCubit = BlocProvider.of<QrisCoinsCubit>(context);
      final qrisWalletCubit = BlocProvider.of<QrisWalletCubit>(context);
      final cartCubit = BlocProvider.of<CartCubit>(context);
      try {
        _order = await OrderService.createOrder(payload: widget.payload);

        qrisCoinsCubit.getQrisCoins();
        qrisWalletCubit.getWalletEntries();
        await _syncCartAfterOrder(cartCubit);
        if (!mounted) return;

        _redirectTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (!mounted) {
            timer.cancel();
            return;
          }
          setState(() {
            _redirectingSeconds--;
          });

          if (_redirectingSeconds == 0) {
            Navigator.of(context).pushAndRemoveUntil(
                CupertinoPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
            timer.cancel();
          }
        });

        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        if (mounted) {
          Navigator.of(context).pop();
          AppConstants.showSnackbar(
              text:
                  'There is some error while creating order. Please contact Qris support for better guidance',
              type: SnackbarType.error);
        }
      }
    });
  }

  @override
  void dispose() {
    _redirectTimer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: _order != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified,
                          color: AppColors.primaryBlue, size: 100),
                      SizedBox(height: 16),
                      Text("Order Placed Successfully!",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlue)),
                      SizedBox(height: 10),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                              "Thank you for your order. Your blood sample collection has been scheduled.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey))),
                      SizedBox(height: 30),
                      Text('Redirecting in $_redirectingSeconds seconds')
                    ]))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    Center(child: Lottie.asset(Assets.jsonsLoadingAnimation)),
                    Text("Processing your order...",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            "Please do not go back or refresh the page.",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16, color: Colors.grey))),
                    SizedBox(height: 30),
                    CircularProgressIndicator(),
                    SizedBox(height: 60)
                  ]));
  }
}
