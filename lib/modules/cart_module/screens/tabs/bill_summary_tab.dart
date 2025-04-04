import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/coupon_discount_type.dart';
import 'package:qris_health/constants/enums/coupon_type.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/address_module/models/pincode/pincode.dart';
import 'package:qris_health/modules/address_module/services/address_service.dart';
import 'package:qris_health/modules/cart_module/components/patient_tile_layout.dart';
import 'package:qris_health/modules/health_module/models/wellness_answer/wellness_answer.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/screens/home_screen.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/orders_modele/models/coupon/coupon.dart';
import 'package:qris_health/modules/orders_modele/models/order_info/order_info.dart';
import 'package:qris_health/modules/orders_modele/screens/order_processing_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_coin_cubit/qris_coins_cubit.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';
import 'package:qris_health/shared/components/billing_amount_row.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/feature_row.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/models/qris_config/qris_config.dart';
import 'package:qris_health/styles/app_colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../constants/api_params.dart';
import '../../../../constants/enums/payment_mode.dart';
import '../../../../generated/assets.dart';
import '../../../orders_modele/models/order_req_model/order_req_model.dart';
import '../../../orders_modele/services/order_service.dart';
import '../../../patients_module/cubits/patients_cubit/patients_cubit.dart';
import '../../components/coupons_bottom_sheet.dart';

class BillSummaryTab extends StatefulWidget {
  final List<WellnessAnswer>? wellnessAnswers;
  const BillSummaryTab({super.key, this.wellnessAnswers});

  @override
  State<BillSummaryTab> createState() => _BillSummaryTabState();
}

class _BillSummaryTabState extends State<BillSummaryTab> {
  final _referController = TextEditingController();
  final _razorpay = Razorpay();
  final _textTheme = Get.textTheme;

  late final Future<List<Pincode>> _pincodeFuture;
  late final QrisConfig _config;

  PaymentMode? _selectedPaymentMode;

  @override
  void initState() {
    super.initState();
    _pincodeFuture = AddressService.getValidPinCodes();
    _config = BlocProvider.of<QrisConfigCubit>(context).state.config!;

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _onPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _onPaymentError);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pincode>>(
        future: _pincodeFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CommonListviewShimmer();
          }

          final pincodes = snapshot.data!;
          final totalQrisCoins =
              BlocProvider.of<QrisCoinsCubit>(context).getTotalCoins();
          final totalWalletAmount =
              BlocProvider.of<QrisWalletCubit>(context).getTotalAmount();

          return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            final cartCubit = BlocProvider.of<CartCubit>(context);
            final address = state.cart.selectedAddress;
            final pincode = pincodes.firstWhereOrNull(
                (element) => element.pincode.toString() == address?.pincode);
            cartCubit.updateCollectionPincode(pincode);

            /// Cart test prices
            final cartTestPrices = cartCubit.getCartTestPrices().toInt();

            /// Cart final value after coupons and wallet amounts
            final cartFinalValue =
                cartCubit.getCartFinalValue(context: context).toInt();

            /// Cart value which consists of package amount, hard copy charges and delivery charges
            final baseCartValue = cartCubit.getBaseCartValue();

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ListView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          physics: BouncingScrollPhysics(),
                          children: [
                        SizedBox(height: 8),
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderColor),
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionTile(
                                initiallyExpanded: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                title: HeadingText(text: 'Cart Details'),
                                tilePadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                childrenPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
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
                                      PackageListTile(
                                          testPackage: cartTest.test,
                                          onSeeDetailsTap: null,
                                          onBookNowTap: null,
                                          suffix: InkWell(
                                              onTap: () {
                                                BlocProvider.of<CartCubit>(
                                                        context)
                                                    .removeTestFromCart(
                                                        cartTest.test.id);
                                              },
                                              child: SvgPicture.asset(
                                                  Assets.iconsDeleteIcon,
                                                  height: 20))),
                                      Column(children: [
                                        ...cartTest.patientIds.map(
                                            (patientId) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                child: BlocBuilder<
                                                        PatientsCubit,
                                                        PatientsState>(
                                                    builder: (context, state) {
                                                  return PatientTileLayout(
                                                      patient: state.patients
                                                          .firstWhereOrNull(
                                                              (element) =>
                                                                  element.id ==
                                                                  patientId),
                                                      actions: cartTest
                                                                  .patientIds
                                                                  .length ==
                                                              1
                                                          ? null
                                                          : [
                                                              VerticalDivider(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.09),
                                                                  thickness:
                                                                      1.5),
                                                              InkWell(
                                                                  onTap: () {
                                                                    BlocProvider.of<CartCubit>(context).removePatientFromTest(
                                                                        patientId:
                                                                            patientId,
                                                                        testId: cartTest
                                                                            .test
                                                                            .id);
                                                                  },
                                                                  child: SvgPicture.asset(
                                                                      Assets
                                                                          .iconsDeleteIcon,
                                                                      height:
                                                                          20))
                                                            ]);
                                                })))
                                      ]),
                                    ]);
                                  }),
                                ])),
                        SizedBox(height: 12),
                        if (baseCartValue > totalWalletAmount)
                          GestureDetector(
                              onTap: () {
                                if (state.cart.redeemCoins) {
                                  AppConstants.showSnackbar(
                                      text:
                                          'Either qris coins or coupon can be applied at once. Please unselect redeem qris coins option to apply coupon',
                                      type: SnackbarType.error);
                                } else {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      constraints:
                                          AppConstants.bottomSheetConstraints,
                                      context: context,
                                      builder: (context) =>
                                          CouponsBottomSheet());
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 16),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        HeadingText(text: 'Offers'),
                                        SizedBox(height: 8),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color:
                                                        AppColors.borderColor)),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  Assets.iconsCouponIcon,
                                                  color: AppColors.green),
                                              SizedBox(width: 8),
                                              Text(
                                                  state.cart.appliedCoupon !=
                                                          null
                                                      ? '${state.cart.appliedCoupon!.couponCode} Applied'
                                                      : 'Apply coupon',
                                                  style: _textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppColors
                                                              .lightSubTextColor)),
                                              Spacer(),
                                              Icon(Icons.keyboard_arrow_right,
                                                  size: 18,
                                                  color: AppColors
                                                      .lightSubTextColor),
                                            ]))
                                      ]))),
                        SizedBox(height: 10),
                        GestureDetector(
                            onTap: () {
                              BlocProvider.of<CartCubit>(context)
                                  .updateHardCopy(
                                      !state.cart.shouldGetHardCopy);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2),
                                          child: SizedBox(
                                              height: 16,
                                              width: 16,
                                              child: Checkbox(
                                                  value: state
                                                      .cart.shouldGetHardCopy,
                                                  onChanged: (value) {
                                                    BlocProvider.of<CartCubit>(
                                                            context)
                                                        .updateHardCopy(!state
                                                            .cart
                                                            .shouldGetHardCopy);
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
                                            Text(
                                                'Hard copy of reports for ₹${pincode?.hardCopyCharge}',
                                                style: _textTheme.bodySmall!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            SizedBox(height: 2),
                                            Text(
                                                'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once reports have been dispatched.',
                                                style: _textTheme.labelSmall!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .textColor))
                                          ])),
                                    ]))),
                        SizedBox(height: 10),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 16),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderColor),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  HeadingText(text: 'Referred By'),
                                  SizedBox(height: 18),
                                  SizedBox(
                                      height: 30,
                                      child: TextField(
                                          controller: _referController,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  borderSide: BorderSide(
                                                      color: AppColors
                                                          .lightSubTextColor)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  borderSide: BorderSide(
                                                      color: AppColors
                                                          .lightSubTextColor)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  borderSide: BorderSide(
                                                      color: AppColors
                                                          .lightSubTextColor))))),
                                ])),
                        SizedBox(height: 10),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: AppColors.borderColor)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  HeadingText(text: 'Bill Summary'),
                                  SizedBox(height: 16),
                                  SummaryInfoRow(
                                      title: 'Package added',
                                      value: '₹$cartTestPrices'),
                                  SizedBox(height: 4),
                                  if (state.cart.shouldGetHardCopy)
                                    SummaryInfoRow(
                                        title: 'Hard copy charges',
                                        value:
                                            '₹${state.cart.shouldGetHardCopy ? '${pincode?.hardCopyCharge}' : '0'}'),
                                  if (!(cartTestPrices >=
                                      (pincode?.minOrder ?? 0)))
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 4),
                                          SummaryInfoRow(
                                              title:
                                                  'Sample collection charges ',
                                              value:
                                                  '₹${'${pincode?.deliveryCharge}'}'),
                                          SizedBox(height: 2),
                                          Text(
                                              '(applicable when order below ₹${pincode?.minOrder})',
                                              style: _textTheme.labelSmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors
                                                          .primaryBlue)),
                                        ]),
                                  if (state.cart.appliedCoupon != null)
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 6),
                                          SummaryInfoRow(
                                              title:
                                                  '${state.cart.appliedCoupon!.couponCode} applied!',
                                              value:
                                                  '-₹${state.cart.appliedCouponAmount?.toInt() ?? 0}',
                                              color: AppColors.green),
                                          SizedBox(height: 2),
                                          _buildCouponDetailText(
                                              state.cart.appliedCoupon!),
                                        ]),
                                  if (state.cart.redeemCoins &&
                                      _config.qcEnable == '1')
                                    Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SummaryInfoRow(
                                            title:
                                                'Qris coins (${_config.qcUsedCoins.toInt()}% of packages amount)',
                                            value:
                                                '-₹${state.cart.redeemedQrisCoins}')),
                                  SizedBox(height: 4),
                                  SummaryInfoRow(
                                      title: 'Wallet amount',
                                      value:
                                          '-₹${BlocProvider.of<CartCubit>(context).state.cart.walletRedeemedAmount}'),
                                  if (BlocProvider.of<CartCubit>(context)
                                          .state
                                          .cart
                                          .walletRedeemedAmount !=
                                      totalWalletAmount)
                                    Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Text(
                                            '(Balance after this transaction ₹${totalWalletAmount - BlocProvider.of<CartCubit>(context).state.cart.walletRedeemedAmount})',
                                            style: _textTheme.labelSmall!
                                                .copyWith(
                                                    fontWeight: FontWeight.w300,
                                                    color: AppColors
                                                        .primaryBlue))),
                                  SizedBox(height: 8),
                                  Row(children: [
                                    Expanded(
                                        child: Text('Cart Value',
                                            style: _textTheme.bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700))),
                                    Text('₹${cartFinalValue.toInt()}',
                                        style: _textTheme.bodySmall!.copyWith(
                                            color: AppColors.primaryPink)),
                                  ]),
                                  if (cartTestPrices >=
                                          double.parse(_config.qcMinCartAmt) &&
                                      _config.qcEnable == '1' &&
                                      baseCartValue > totalWalletAmount)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            BlocProvider.of<CartCubit>(context)
                                                .toggleRedeemCoins();
                                          },
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                    child: Checkbox(
                                                        value: state
                                                            .cart.redeemCoins,
                                                        onChanged: (value) {
                                                          BlocProvider.of<
                                                                      CartCubit>(
                                                                  context)
                                                              .toggleRedeemCoins();
                                                        },
                                                        side: BorderSide(
                                                            color: AppColors
                                                                .lightSubTextColor))),
                                                SizedBox(width: 12),
                                                Expanded(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                      Text.rich(
                                                          style: _textTheme
                                                              .bodySmall,
                                                          TextSpan(children: [
                                                            TextSpan(
                                                                text:
                                                                    'Redeem my Qris Coins ',
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                            TextSpan(
                                                                text:
                                                                    '( $totalQrisCoins coins )',
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .goldenColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                          ])),
                                                      SizedBox(height: 4),
                                                      Column(children: [
                                                        Row(children: [
                                                          Container(
                                                              height: 5,
                                                              width: 5,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .black)),
                                                          SizedBox(width: 6),
                                                          Text(
                                                              'Coupon codes will not be applicable with Qris coins',
                                                              style: _textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .textColor)),
                                                        ]),
                                                        SizedBox(height: 4),
                                                        Row(children: [
                                                          Container(
                                                              height: 5,
                                                              width: 5,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .black)),
                                                          SizedBox(width: 6),
                                                          Text(
                                                              '${cartFinalValue * _config.qcAmount ~/ 100} coins ',
                                                              style: _textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: AppColors
                                                                          .goldenColor)),
                                                          Text(
                                                              'will be earned on this order',
                                                              style: _textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))
                                                        ]),
                                                      ]),
                                                    ]))
                                              ])),
                                    ),
                                ])),
                        SizedBox(height: 10),
                        if (cartFinalValue > 0)
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 16),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    HeadingText(text: 'Payment Method'),
                                    SizedBox(height: 12),
                                    _buildRadioButtonRow(
                                        title:
                                            'Credit/Debit card, UPI, Net banking, Wallet',
                                        paymentMode: PaymentMode.online),
                                    _buildRadioButtonRow(
                                        title: 'Cash on Delivery',
                                        paymentMode: PaymentMode.cod)
                                  ])),
                      ])),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: cartFinalValue > 0
                          ? _selectedPaymentMode == null
                              ? null
                              : _selectedPaymentMode == PaymentMode.cod
                                  ? () => _createOrder()
                                  : _checkout
                          : () => _createOrder(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue),
                      child: Text(cartFinalValue > 0
                          ? _selectedPaymentMode == PaymentMode.cod
                              ? 'Confirm Booking'
                              : 'Pay ₹$cartFinalValue/-'
                          : 'Complete Booking')),
                  SizedBox(height: 16),
                ]);
          });
        });
  }

  Widget _buildRadioButtonRow(
      {required String title, required PaymentMode paymentMode}) {
    return InkWell(
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

  Widget _buildCouponDetailText(Coupon coupon) {
    final couponType = coupon.discountAction;
    final testAmount = BlocProvider.of<CartCubit>(context).getCartTestPrices();
    final style = _textTheme.labelSmall!
        .copyWith(fontWeight: FontWeight.w300, color: AppColors.primaryBlue);

    if (couponType == CouponType.dc) {
      return Container();
    }

    if (couponType == CouponType.cb) {
      String text;
      if (coupon.discountMode == CouponDiscountType.per) {
        text =
            '(You will get %${coupon.couponPrice.toInt()} (₹${(testAmount * coupon.couponPrice) ~/ 100}) cashback right after your order completion)';
      } else {
        text =
            '(You will get ₹${testAmount - coupon.couponPrice} cashback right after your order completion)';
      }

      return Text(text, style: style);
    } else if (couponType == CouponType.sc) {
      return Text(coupon.shortDesc, style: style);
    }

    return Container();
  }

  Future<void> _onPaymentSuccess(PaymentSuccessResponse response) async {
    try {
      await _createOrder(razorpayPaymentId: response.paymentId);
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    } finally {}
  }

  Future<void> _onPaymentError(PaymentFailureResponse response) async {
    switch (response.code) {
      case Razorpay.NETWORK_ERROR:
        AppConstants.showSnackbar(
            text:
                'Order was cancelled due to some network problem or cancelled by user',
            type: SnackbarType.warning);
        break;

      case Razorpay.PAYMENT_CANCELLED:
        AppConstants.showSnackbar(
            text: 'Payment Cancelled', type: SnackbarType.warning);
        break;

      case Razorpay.INCOMPATIBLE_PLUGIN:
        AppConstants.showSnackbar(
            text: 'Incompatible Plugins', type: SnackbarType.error);
        break;

      case Razorpay.UNKNOWN_ERROR:
        AppConstants.showSnackbar(
            text: 'Unknown Error Please Try Again', type: SnackbarType.error);
        break;

      default:
        AppConstants.showSnackbar(
            text: 'There is an Error Please Try Again',
            type: SnackbarType.error);
    }
  }

  Future<void> _checkout() async {
    try {
      final cartCubit = BlocProvider.of<CartCubit>(context);
      final cartFinalValue = cartCubit.getCartFinalValue(context: context);

      var options = {
        'key': AppConstants.razorpayKey,
        'amount': cartFinalValue * 100,
        'name': 'Qris Health',
        'image':
            'https://cdn-1.webcatalog.io/catalog/qris-health/qris-health-icon-filled-256.webp?v=1714781957813',
        'description':
            "Securely book your health tests with Qris Health using our seamless online payment system.",
        'prefill': {'contact': ApiParams.getInstance()!.phoneNumber},
        "theme": {"color": "#B23C97"}
      };

      _razorpay.open(options);
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }

  Future<void> _createOrder({String? razorpayPaymentId}) async {
    try {
      final cartCubit = BlocProvider.of<CartCubit>(context);
      final cart = cartCubit.state.cart;

      final encodedAddress = AppConstants.encodeStringToBase64(
          json.encode(cart.selectedAddress!.toJson()));

      final encodedCouponData = cart.appliedCoupon == null
          ? ''
          : AppConstants.encodeStringToBase64(
              json.encode(cart.appliedCoupon!.toJson()));

      final productsData =
          AppConstants.encodeStringToBase64(_getProductsData());

      final orderReqModel = OrderReqModel(
          userId: ApiParams.getInstance()!.userId!,
          packagesAmount: cartCubit.getCartTestPrices().round(),
          collectionCharges: cartCubit.getDeliveryCharge().toString(),
          hardCopyCharges: cartCubit.getHardCopyCharges().toString(),
          cartFinalValue: cartCubit.getCartFinalValue(context: context).round(),
          paymentMode: _selectedPaymentMode!,
          razorpayPaymentId: razorpayPaymentId,
          coupon: cart.appliedCoupon,
          redeemedWalletAmount: cart.walletRedeemedAmount,
          redeemedQrisCoins: cart.redeemedQrisCoins,
          slotDate: DateFormat('yyyyMMdd').format(cart.collectionDate!),
          slotTime:
              '${cart.timeSlot!.startingTime}-${cart.timeSlot!.endingTime}',
          pincode: cart.pincode!.pincode.toString(),
          encodedProductData: productsData,
          encodedAddress: encodedAddress,
          encodedCouponData: encodedCouponData,
          referBy: _referController.text,
          paymentResponse: '',
          tubeType: cartCubit.getCollectiveTubeType(),
          sampleType: cartCubit.getCollectiveSampleType(),
          appliedCouponAmount: cart.appliedCouponAmount ?? 0,
          phoneNumber: ApiParams.getInstance()!.phoneNumber!,
          wellnessAnswers: widget.wellnessAnswers
              ?.map((answer) => answer.copyWith.call(
                  answer: answer.answer.trim(),
                  ptntId: cart.cartTests.firstOrNull?.patientIds.firstOrNull
                      .toString()))
              .toList());

      await Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) =>
              OrderProcessingScreen(orderReqModel: orderReqModel)));
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }

  String _getProductsData() {
    final cart = BlocProvider.of<CartCubit>(context).state.cart;
    final patientsCubit = BlocProvider.of<PatientsCubit>(context);

    final productMap = <String, OrderData>{};

    for (var cartTest in cart.cartTests) {
      final patientsMap = {
        for (var patientId in cartTest.patientIds)
          patientId.toString(): OrderPatient(
              name: patientsCubit
                      .getPatientByPatientId(patientId: patientId)
                      ?.name ??
                  '',
              id: patientId.toString(),
              gender: patientsCubit
                      .getPatientByPatientId(patientId: patientId)
                      ?.gender ??
                  '',
              dob: patientsCubit
                      .getPatientByPatientId(patientId: patientId)
                      ?.dob ??
                  '',
              mobile: patientsCubit
                      .getPatientByPatientId(patientId: patientId)
                      ?.mobile ??
                  '')
      };

      productMap[cartTest.test.id.toString()] = OrderData(
          product: Product(
              title: cartTest.test.title ?? '',
              id: cartTest.test.id.toString(),
              price: cartTest.test.specialPrice?.toString() ?? '0',
              quantity: cartTest.patientIds.length,
              sampleType: cartTest.test.sampleType ?? '',
              tubeType: cartTest.test.tubeType ?? ''),
          patients: patientsMap);
    }

    return json.encode(productMap);
  }
}
