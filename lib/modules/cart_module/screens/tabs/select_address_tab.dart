import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/address_module/components/add_address_bottom_sheet.dart';
import 'package:qris_health/modules/address_module/components/address_list_tile.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../components/patient_tile_layout.dart';

class SelectAddressTab extends StatefulWidget {
  final Function() onContinue;
  const SelectAddressTab({super.key, required this.onContinue});

  @override
  State<SelectAddressTab> createState() => _SelectAddressTabState();
}

class _SelectAddressTabState extends State<SelectAddressTab> {
  final _textTheme = Get.textTheme;

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
                  ...List.generate(1, (index) {
                    return Column(children: [
                      PackageListTile(
                          onSeeDetailsTap: null, onBookNowTap: null),
                      SizedBox(height: 12),
                      ...List.generate(2, (index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: PatientTileLayout(actions: [
                              VerticalDivider(
                                  color: Colors.black.withOpacity(0.09),
                                  thickness: 1.5),
                              SvgPicture.asset(
                                  'assets/images/icons/delete_icon.svg')
                            ]));
                      }),
                    ]);
                  }),
                ])),
        SizedBox(height: 16),
        SizedBox(
            height: 40,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 0.6, color: AppColors.primaryPink),
                    backgroundColor: AppColors.primaryPink.withOpacity(0.09)),
                onPressed: () {},
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
                    builder: (context) => AddAddressBottomSheet());
              },
              child: UnderlineText(
                  text: '+ Add New Address',
                  underlineColor: AppColors.primaryPink,
                  style: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryPink))),
        ]),
        SizedBox(height: 18),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return AddressListTile();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 8);
            },
            itemCount: 4),
      ])),
      SizedBox(height: 16),
      ElevatedButton(
          onPressed: widget.onContinue,
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
          child: Text('Continue')),
      SizedBox(height: 16),
    ]);
  }
}
