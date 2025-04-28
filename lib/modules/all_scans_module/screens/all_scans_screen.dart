import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/subscan_type.dart';
import 'package:qris_health/modules/all_scans_module/components/scan_category_container.dart';
import 'package:qris_health/modules/all_scans_module/components/subscan_bottom_sheet.dart';
import 'package:qris_health/modules/all_scans_module/components/subscan_list_tile_horizontal.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/request_callback_dialog.dart';
import 'package:qris_health/shared/components/why_choose_us_container.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../constants/enums/scan_type.dart';
import '../../../shared/components/how_to_book_container.dart';

class AllScansScreen extends StatefulWidget {
  const AllScansScreen({super.key});

  @override
  State<AllScansScreen> createState() => _AllScansScreenState();
}

class _AllScansScreenState extends State<AllScansScreen> {
  final _searchController = TextEditingController();
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue),
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) => RequestCallbackDialog(
                              query: 'Callback request from all scans page'));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/icons/callback_icon.png',
                              height: 32),
                          SizedBox(width: 8),
                          Text('Request Call Back')
                        ])))),
        appBar: CommonAppBar(title: 'Scans'),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.scaffoldPadding, vertical: 16),
            children: [
              FilterTextField(
                  onFieldSubmitted: (value) {},
                  controller: _searchController,
                  onChanged: (value) {},
                  hintText: 'Search for scans...',
                  suffixIcon: null),
              SizedBox(height: 16),
              Row(children: [
                Expanded(
                    child: _buildScanContainer(
                        onTap: () async {
                          _showBottomSheet(scanType: ScanType.CT_SCAN);
                        },
                        scanType: ScanType.CT_SCAN)),
                SizedBox(width: 20),
                Expanded(
                    child: _buildScanContainer(
                        onTap: () {
                          _showBottomSheet(scanType: ScanType.ULTRASOUND);
                        },
                        scanType: ScanType.ULTRASOUND)),
              ]),
              SizedBox(height: 16),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    final scanType = ScanType.values[index + 2];

                    return ScanCategoryContainer(scanType: scanType);
                  })),
              SizedBox(height: 32),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (i) {
                    final index = i + 4;
                    final scanType = ScanType.values[index + 2];

                    return ScanCategoryContainer(scanType: scanType);
                  })),
              SizedBox(height: 32),
              HeadingText(text: 'Our Services'),
              SizedBox(height: 16),
              SizedBox(
                  height: 145,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SubscanListTileHorizontal(
                            subScanType: SubScanType.values[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: SubScanType.values.length)),
              SizedBox(height: 18),
              WhyChooseUsContainer(),
              SizedBox(height: 18),
              HowToBookContainer(),
            ]));
  }

  Widget _buildScanContainer(
      {required ScanType scanType, required Function() onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(scanType.formattedName,
                      style: _textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlue))),
              Expanded(child: Image.asset(scanType.iconPath, height: 73)),
            ])));
  }

  Future<void> _showBottomSheet({required ScanType scanType}) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        constraints: AppConstants.bottomSheetConstraints,
        context: context,
        builder: (context) => SubScanBottomSheet(scanType: scanType));
  }
}
