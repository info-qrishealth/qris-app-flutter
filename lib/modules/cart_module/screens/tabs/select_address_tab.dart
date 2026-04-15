import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/address_module/components/add_address_bottom_sheet.dart';
import 'package:qris_health/modules/address_module/components/address_list_tile.dart';
import 'package:qris_health/modules/address_module/services/address_service.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/screens/search_package_screen.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../address_module/models/address/address.dart';
import '../../components/patient_tile_layout.dart';

class SelectAddressTab extends StatefulWidget {
  final Future<void> Function(Address) onContinue;
  const SelectAddressTab({super.key, required this.onContinue});

  @override
  State<SelectAddressTab> createState() => _SelectAddressTabState();
}

class _SelectAddressTabState extends State<SelectAddressTab> {
  final _textTheme = Get.textTheme;
  late final Future<List<Address>> _addressFuture;
  List<Address>? _addresses;

  @override
  void initState() {
    super.initState();
    _addressFuture = AddressService.getAddressesByUserId(
        userId: ApiParams.getInstance()!.userId!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: ListView(physics: BouncingScrollPhysics(), children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black.withOpacity(0.09))),
            child: ExpansionTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.white,
                initiallyExpanded: true,
                tilePadding: EdgeInsets.symmetric(horizontal: 10),
                iconColor: AppColors.primaryBlue,
                title: HeadingText(text: 'Package Details'),
                childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                    return Column(
                        children: state.cart!.cartTests
                            .map((cartTest) => Column(children: [
                                  PackageListTile(
                                      customDescription: Container(),
                                      testPackage: cartTest.test,
                                      onSeeDetailsTap: null,
                                      onBookNowTap: null,
                                      suffix: InkWell(
                                          onTap: () {
                                            BlocProvider.of<CartCubit>(context)
                                                .removeTestFromCart(
                                                    cartTest.test!.id);
                                          },
                                          child: SvgPicture.asset(
                                              Assets.iconsDeleteIcon,
                                              height: 20))),
                                  Column(children: [
                                    ...cartTest.patientIds!.map((patientId) =>
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: BlocBuilder<PatientsCubit,
                                                    PatientsState>(
                                                builder: (context, state) {
                                              return PatientTileLayout(
                                                  patient: state.patients
                                                      .firstWhereOrNull(
                                                          (element) =>
                                                              element.id ==
                                                              patientId),
                                                  actions:
                                                      cartTest.patientIds
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
                                                                            .test!
                                                                            .id);
                                                                  },
                                                                  child: SvgPicture
                                                                      .asset(Assets
                                                                          .iconsDeleteIcon))
                                                            ]);
                                            })))
                                  ]),
                                ]))
                            .toList());
                  }),
                ])),
        SizedBox(height: 16),
        SizedBox(
            height: 40,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 0.6, color: AppColors.primaryPink),
                    backgroundColor: AppColors.primaryPink.withOpacity(0.09)),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => SearchPackageScreen()));
                },
                child: Text('Add more test +',
                    style: _textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryPink)))),
        SizedBox(height: 24),
        Row(children: [
          Expanded(child: HeadingText(text: 'Select Collection Address')),
          InkWell(
              onTap: () async {
                await showModalBottomSheet(
                    context: context,
                    constraints: AppConstants.bottomSheetConstraints,
                    isScrollControlled: true,
                    builder: (context) =>
                        AddAddressBottomSheet(onAddressAdded: (addedAddress) {
                          _addresses = [..._addresses!, addedAddress];
                          setState(() {});
                        }));
              },
              child: UnderlineText(
                  text: '+ Add New Address',
                  underlineColor: AppColors.primaryPink,
                  style: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryPink))),
        ]),
        SizedBox(height: 18),
        FutureBuilder<List<Address>>(
            future: _addressFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _addresses ??= snapshot.data!;
                _addresses = _addresses!
                    .where((element) => element.status == 1)
                    .toList();

                return BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final address = _addresses![index];

                        return InkWell(
                            onTap: () {
                              BlocProvider.of<CartCubit>(context)
                                  .setSelectedAddressLocal(address);
                            },
                            child: AddressListTile(
                                isSelected: address.id ==
                                    state.cart?.selectedAddress?.id,
                                address: _addresses![index],
                                onDeleteTap: () async {
                                  try {
                                    final updatedAddress = await AddressService
                                        .changeAddressStatus(
                                            addressId: address.id!,
                                            desiredStatus: 0);

                                    if (state.cart?.selectedAddress?.id ==
                                        address.id) {
                                      BlocProvider.of<CartCubit>(context)
                                          .setSelectedAddressLocal(null);
                                    }

                                    _addresses![index] = updatedAddress;
                                    setState(() {});
                                  } catch (e) {
                                    AppConstants.showSnackbar(
                                        text: e.toString(),
                                        type: SnackbarType.error);
                                  }
                                }));
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8);
                      },
                      itemCount: _addresses!.length);
                });
              }

              return Container();
            }),
      ])),
      SizedBox(height: 16),
      BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        return ElevatedButton(
            onPressed: state.cart?.selectedAddress == null
                ? null
                : () async => widget.onContinue(state.cart!.selectedAddress!),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue),
            child: Text('Continue'));
      }),
      SizedBox(height: 16),
    ]);
  }
}
