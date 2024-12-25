import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/cart_module/components/step_indicator/step_indicator.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/bill_summary_tab.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/select_address_tab.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/select_patient_tab.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/time_slot_tab.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _pageController = PageController();
  final _textTheme = Get.textTheme;
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'My Cart'),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: StepIndicator(_selectedPage)),
                      SizedBox(height: 50),
                      Expanded(
                          child: PageView(
                              controller: _pageController,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                            SelectPatientTab(onContinue: () {
                              _animateToPage(pageIndex: 1);
                            }),
                            SelectAddressTab(),
                            TimeSlotTab(),
                            BillSummaryTab()
                          ])),
                    ]))));
  }

  void _animateToPage({required int pageIndex}) {
    _pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    _selectedPage = pageIndex;
    setState(() {});
  }
}
