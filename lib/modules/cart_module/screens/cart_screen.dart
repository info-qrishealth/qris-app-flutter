import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/cart_module/components/step_indicator/step_indicator.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/bill_summary_tab.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/select_address_tab.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/select_patient_tab.dart';
import 'package:qris_health/modules/cart_module/screens/tabs/time_slot_tab.dart';
import 'package:qris_health/modules/health_module/models/wellness_answer/wellness_answer.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

class CartScreen extends StatefulWidget {
  final int? initialPage;
  final TestPackageModel? testPackageModel;
  final List<WellnessAnswer>? wellnessAnswers;

  const CartScreen(
      {super.key,
      required this.testPackageModel,
      this.initialPage,
      this.wellnessAnswers});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.initialPage != null) {
      _selectedPage = widget.initialPage!;
    }
    _pageController = PageController(initialPage: _selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'My Cart'),
        body: SafeArea(
            child: BlocBuilder<CartCubit, CartState>(
                buildWhen: (p, c) =>
                    p.cart.cartTests.length != c.cart.cartTests.length,
                builder: (context, state) {
                  if (state.cart.cartTests.isEmpty) {
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset(Assets.illustrationsEmptyCartIllustration,
                              height: 180),
                          SizedBox(height: 24),
                          Text('No test added.',
                              style: Get.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGrey)),
                          SizedBox(height: 50)
                        ]));
                  }

                  return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.scaffoldPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: CartStepIndicator(_selectedPage)),
                            SizedBox(height: 50),
                            Expanded(
                                child: PageView(
                                    controller: _pageController,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                  SelectPatientTab(
                                      testPackageModel: widget.testPackageModel,
                                      onContinue: (selectedPatient) async {
                                        await BlocProvider.of<CartCubit>(context)
                                            .addPatientToTest(
                                              patientId: selectedPatient.id!,
                                              testId: widget.testPackageModel!.id,
                                            );
                                        _animateToPage(pageIndex: 1);
                                      }),
                                  SelectAddressTab(onContinue: (address) async {
                                    await BlocProvider.of<CartCubit>(context)
                                        .changeAddress(address);
                                    _animateToPage(pageIndex: 2);
                                  }),
                                  TimeSlotTab(onContinue: () async {
                                    final cartCubit =
                                        BlocProvider.of<CartCubit>(context);
                                    final cart = cartCubit.state.cart;
                                    if (cart.collectionDate != null) {
                                      await cartCubit.updateCollectionDate(
                                          cart.collectionDate!);
                                    }
                                    _animateToPage(pageIndex: 3);
                                  }),
                                  BillSummaryTab(
                                      wellnessAnswers: widget.wellnessAnswers)
                                ])),
                          ]));
                })));
  }

  void _animateToPage({required int pageIndex}) {
    _pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    _selectedPage = pageIndex;
    setState(() {});
  }
}
