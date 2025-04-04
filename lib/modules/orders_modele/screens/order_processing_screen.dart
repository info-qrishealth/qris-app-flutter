import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/orders_modele/models/order/order.dart';
import 'package:qris_health/modules/orders_modele/models/order_req_model/order_req_model.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/enums/snackbar_type.dart';
import '../../home_module/screens/home_screen.dart';
import '../../refer_and_earn_module/cubits/qris_coin_cubit/qris_coins_cubit.dart';
import '../../refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';
import '../cart_cubit/cart_cubit.dart';
import '../services/order_service.dart';

class OrderProcessingScreen extends StatefulWidget {
  final OrderReqModel orderReqModel;
  const OrderProcessingScreen({super.key, required this.orderReqModel});

  @override
  _OrderProcessingScreenState createState() => _OrderProcessingScreenState();
}

class _OrderProcessingScreenState extends State<OrderProcessingScreen> {
  Order? _order;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        _order =
            await OrderService.createOrder(orderReqModel: widget.orderReqModel);

        BlocProvider.of<QrisCoinsCubit>(context).getQrisCoins();
        BlocProvider.of<QrisWalletCubit>(context).getWalletEntries();
        BlocProvider.of<CartCubit>(context).clearCart();

        setState(() {});
      } catch (e) {
        Navigator.of(context).pop();
        AppConstants.showSnackbar(
            text:
                'There is some error while creating order. Please contact Qris support for better guidance',
            type: SnackbarType.error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: _order != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(Icons.verified,
                              color: AppColors.green, size: 100),
                          SizedBox(height: 16),
                          Text("Order Placed Successfully!",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.green)),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  "Thank you for your order. Your blood sample collection has been scheduled.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey))),
                          SizedBox(height: 30),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppConstants.scaffoldPadding),
                              child: Row(children: [
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()),
                                                  (route) => false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        child: Text("Go to Home",
                                            style: TextStyle(fontSize: 16))))
                              ]))
                        ])
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Center(
                              child:
                                  Lottie.asset(Assets.jsonsLoadingAnimation)),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey))),
                          SizedBox(height: 30),
                          CircularProgressIndicator(),
                        ]))),
    );
  }
}
