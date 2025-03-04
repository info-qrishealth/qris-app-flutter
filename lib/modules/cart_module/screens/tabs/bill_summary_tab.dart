import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';
import 'package:qris_health/modules/cart_module/components/patient_tile_layout.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/shared/components/billing_amount_row.dart';
import 'package:qris_health/shared/components/feature_row.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../../constants/enums/payment_mode.dart';
import '../../../../generated/assets.dart';
import '../../../patients_module/cubits/patients_cubit/patients_cubit.dart';
import '../../components/coupons_bottom_sheet.dart';

class BillSummaryTab extends StatefulWidget {
  const BillSummaryTab({super.key});

  @override
  State<BillSummaryTab> createState() => _BillSummaryTabState();
}

class _BillSummaryTabState extends State<BillSummaryTab> {
  final _textTheme = Get.textTheme;
  bool _shouldGetHardCopy = false;
  bool _redeemCoins = false;
  PaymentMode? _selectedPaymentMode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final address = state.cart.selectedAddress;

        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ListView(physics: BouncingScrollPhysics(), children: [
                SizedBox(height: 8),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: ExpansionTile(
                        initiallyExpanded: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        title: HeadingText(text: 'Cart Details'),
                        tilePadding: EdgeInsets.symmetric(horizontal: 10),
                        childrenPadding: EdgeInsets.symmetric(horizontal: 8),
                        children: [
                          FeatureRow(
                              fontColor: AppColors.black,
                              svgPath: Assets.drawerIconsLocationIcon,
                              title:
                                  '${address?.house}, ${address?.address1} ${address?.address2 != null && address!.address2!.isNotEmpty ? ', ${address.address2}' : ''} ${address?.landmark != null && address!.landmark!.isNotEmpty ? ', ${address.landmark}' : ''} ${address?.pincode != null && address!.pincode!.isNotEmpty ? ', ${address.pincode}' : ''}, ${address?.state ?? ''}'),
                          SizedBox(height: 4),
                          FeatureRow(
                              svgPath: Assets.iconsClockIcon,
                              fontColor: AppColors.black,
                              title:
                                  '${DateFormat().add_yMMMd().format(state.cart.collectionDate!)} (${DateFormat().add_jm().format(state.cart.timeSlot!.startingTime.toDateTime!.toLocal())} - ${DateFormat().add_jm().format(state.cart.timeSlot!.endingTime.toDateTime!.toLocal())})'),
                          SizedBox(height: 12),
                          ...state.cart.cartTests.map((cartTest) {
                            return Column(children: [
                              FutureBuilder<TestPackageModel>(
                                  future: TestService.getTestByTestId(
                                      id: cartTest.testId),
                                  builder: (context, snapshot) {
                                    return PackageListTile(
                                        testPackage: snapshot.data,
                                        onSeeDetailsTap: null,
                                        onBookNowTap: null,
                                        suffix: InkWell(
                                            onTap: () {
                                              BlocProvider.of<CartCubit>(
                                                      context)
                                                  .removeTestFromCart(
                                                      cartTest.testId);
                                            },
                                            child: SvgPicture.asset(
                                                Assets.iconsDeleteIcon,
                                                height: 20)));
                                  }),
                              Column(children: [
                                ...cartTest.patientIds.map((patientId) =>
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: BlocBuilder<PatientsCubit,
                                                PatientsState>(
                                            builder: (context, state) {
                                          return PatientTileLayout(
                                              patient: state.patients
                                                  .firstWhereOrNull((element) =>
                                                      element.id == patientId),
                                              actions: cartTest
                                                          .patientIds.length ==
                                                      1
                                                  ? null
                                                  : [
                                                      VerticalDivider(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.09),
                                                          thickness: 1.5),
                                                      InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                        CartCubit>(
                                                                    context)
                                                                .removePatientFromTest(
                                                                    patientId:
                                                                        patientId,
                                                                    testId: cartTest
                                                                        .testId);
                                                          },
                                                          child: SvgPicture.asset(
                                                              Assets
                                                                  .iconsDeleteIcon,
                                                              height: 20))
                                                    ]);
                                        })))
                              ]),
                            ]);
                          }),
                        ])),
                SizedBox(height: 12),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          constraints: AppConstants.bottomSheetConstraints,
                          context: context,
                          builder: (context) => CouponsBottomSheet());
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              HeadingText(text: 'Offers'),
                              SizedBox(height: 8),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: AppColors.borderColor)),
                                  child: Row(children: [
                                    SvgPicture.asset(
                                        'assets/images/icons/coupon_icon.svg',
                                        color: AppColors.green),
                                    SizedBox(width: 8),
                                    Text('Apply coupon',
                                        style: _textTheme.bodySmall!.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color:
                                                AppColors.lightSubTextColor)),
                                    Spacer(),
                                    Icon(Icons.keyboard_arrow_right,
                                        size: 18,
                                        color: AppColors.lightSubTextColor),
                                  ]))
                            ]))),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _shouldGetHardCopy = !_shouldGetHardCopy;
                      });
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Checkbox(
                                          value: _shouldGetHardCopy,
                                          onChanged: (value) {
                                            setState(() {
                                              _shouldGetHardCopy =
                                                  !_shouldGetHardCopy;
                                            });
                                          },
                                          side: BorderSide(
                                              color: AppColors
                                                  .lightSubTextColor)))),
                              SizedBox(width: 12),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                    Text('Hard copy of reports for ₹99',
                                        style: _textTheme.bodySmall!.copyWith(
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(height: 2),
                                    Text(
                                        'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once reports have been dispatched.',
                                        style: _textTheme.labelSmall!.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textColor))
                                  ])),
                            ]))),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeadingText(text: 'Referred By'),
                          SizedBox(height: 18),
                          SizedBox(
                              height: 30,
                              child: TextField(
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          borderSide: BorderSide(
                                              color:
                                                  AppColors.lightSubTextColor)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          borderSide: BorderSide(
                                              color:
                                                  AppColors.lightSubTextColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .lightSubTextColor))))),
                        ])),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderColor)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeadingText(text: 'Bill Summary'),
                          SizedBox(height: 16),
                          SummaryInfoRow(
                              title: 'Package added', value: '₹1099'),
                          SizedBox(height: 4),
                          SummaryInfoRow(
                              title: 'Hard copy charges', value: '₹99'),
                          SizedBox(height: 4),
                          SummaryInfoRow(
                              title: 'Sample collection charges ',
                              value: '₹99'),
                          SizedBox(height: 2),
                          Text('(applicable when order below ₹499)',
                              style: _textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.primaryBlue)),
                          SizedBox(height: 4),
                          SummaryInfoRow(
                              title: 'Yay! Coupon applied',
                              value: '-₹99',
                              color: AppColors.green),
                          SizedBox(height: 8),
                          Row(children: [
                            Expanded(
                                child: Text('Cart Value',
                                    style: _textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w700))),
                            Text('₹1198',
                                style: _textTheme.bodySmall!
                                    .copyWith(color: AppColors.primaryPink)),
                          ]),
                          SizedBox(height: 18),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _redeemCoins = !_redeemCoins;
                                });
                              },
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: Checkbox(
                                            value: _redeemCoins,
                                            onChanged: (value) {
                                              setState(() {
                                                _redeemCoins = !_redeemCoins;
                                              });
                                            },
                                            side: BorderSide(
                                                color: AppColors
                                                    .lightSubTextColor))),
                                    SizedBox(width: 12),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text.rich(
                                              style: _textTheme.bodySmall,
                                              TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        'Redeem my Qris Coins ',
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.textColor,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                TextSpan(
                                                    text: '( 2100 coins )',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .goldenColor,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ])),
                                          SizedBox(height: 4),
                                          Column(children: [
                                            Row(children: [
                                              Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.black)),
                                              SizedBox(width: 6),
                                              Text(
                                                  'Coupon codes will not be applicable with Qris coins',
                                                  style: _textTheme.labelSmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .textColor)),
                                            ]),
                                            SizedBox(height: 4),
                                            Row(children: [
                                              Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.black)),
                                              SizedBox(width: 6),
                                              Text('1099 coins ',
                                                  style: _textTheme.labelSmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppColors
                                                              .goldenColor)),
                                              Text(
                                                  'will be earned on this order',
                                                  style: _textTheme.labelSmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w700))
                                            ]),
                                          ]),
                                        ]))
                                  ])),
                        ])),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeadingText(text: 'Payment Method'),
                          SizedBox(height: 12),
                          _buildRadioButtonRow(
                              title:
                                  'Credit/Debit card, UPI, Net banking, Wallet',
                              paymentMode: PaymentMode.razorpay),
                          _buildRadioButtonRow(
                              title: 'Cash on Delivery',
                              paymentMode: PaymentMode.cod)
                        ])),
              ])),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue),
                  child: Text('Pay ₹1198/-')),
              SizedBox(height: 16),
            ]);
      },
    );
  }

  Widget _buildRadioButtonRow(
      {required String title, required PaymentMode paymentMode}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMode = paymentMode;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          SizedBox(
              height: 16,
              width: 16,
              child: Radio<PaymentMode>(
                  value: paymentMode,
                  groupValue: _selectedPaymentMode,
                  onChanged: (paymentMode) {
                    setState(() {
                      _selectedPaymentMode = paymentMode;
                    });
                  })),
          SizedBox(width: 8),
          Text(title,
              style:
                  _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400)),
        ]),
      ),
    );
  }
}
