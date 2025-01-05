import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/scan_type.dart';
import 'package:qris_health/constants/enums/subscan_type.dart';
import 'package:qris_health/modules/all_scans_module/components/scan_category_container.dart';
import 'package:qris_health/modules/all_scans_module/components/subscan_list_tile_horizontal.dart';
import 'package:qris_health/modules/all_scans_module/models/subscan_model.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/faq_list_tile.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/how_to_book_container.dart';
import 'package:qris_health/shared/components/request_callback_dialog.dart';
import 'package:qris_health/shared/components/why_choose_us_container.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../shared/components/double_tick_row.dart';

class SubscanInfoScreen extends StatefulWidget {
  final SubScanType subScanType;
  const SubscanInfoScreen({super.key, required this.subScanType});

  @override
  State<SubscanInfoScreen> createState() => _SubscanInfoScreenState();
}

class _SubscanInfoScreenState extends State<SubscanInfoScreen> {
  final _textTheme = Get.textTheme;
  late SubscanModel _subscanModel;

  @override
  void initState() {
    super.initState();
    _subscanModel = widget.subScanType.subScanModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => RequestCallbackDialog());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/icons/callback_icon.png',
                              height: 32),
                          SizedBox(width: 8),
                          Text('Request Call Back')
                        ])))),
        appBar: CommonAppBar(title: _subscanModel.appBarTitle),
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.scaffoldPadding, vertical: 16),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(_subscanModel.imagePath)),
              SizedBox(height: 20),
              HeadingText(text: _subscanModel.firstHeading),
              SizedBox(height: 10),
              _buildDescriptionContainer(
                  text: _subscanModel.firstHeadingDescription),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryBlue,
                            AppColors.primaryPink
                          ])),
                  child: Column(children: [
                    Text('Our Price',
                        style: _textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700, color: Colors.white)),
                    SizedBox(height: 16),
                    ..._splitList(_subscanModel.prices, 2).map((element) => Row(
                        children: element
                            .map((element) => Expanded(
                                child: _buildPriceContainer(price: element)))
                            .toList()))
                  ])),
              SizedBox(height: 20),
              HeadingText(text: _subscanModel.secondTitle),
              SizedBox(height: 10),
              _buildDescriptionContainer(text: _subscanModel.secondDescription),
              SizedBox(height: 20),
              HeadingText(text: _subscanModel.whyToChooseTitle),
              SizedBox(height: 12),
              ..._subscanModel.whyToChoose
                  .map((choose) => DoubleTickRow(text: choose)),
              SizedBox(height: 20),
              HeadingText(text: _subscanModel.thirdHeading),
              SizedBox(height: 10),
              SizedBox(
                  height: 145,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SubscanListTileHorizontal(
                            subScanType: SubScanType.MRI_ABDOMEN_AND_PELVIS);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
              SizedBox(height: 20),
              Row(children: [
                Expanded(child: HeadingText(text: 'Everything You Need')),
              ]),
              SizedBox(height: 10),
              SizedBox(
                  height: 77,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final scanType = ScanType.values[index];

                        return ScanCategoryContainer(scanType: scanType);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 12);
                      },
                      itemCount: ScanType.values.length)),
              SizedBox(height: 32),
              HeadingText(text: 'Frequently Asked Questions'),
              SizedBox(height: 12),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                      children: _subscanModel.faqs
                          .map((faq) => FaqListTile(
                              question: faq.question, answer: faq.answer))
                          .toList())),
              SizedBox(height: 20),
              WhyChooseUsContainer(),
              SizedBox(height: 20),
              HowToBookContainer(),
            ]));
  }

  Widget _buildDescriptionContainer({required String text}) {
    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(16)),
        child: Text(text,
            style: _textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
                height: 1.3)));
  }

  List<List<Price>> _splitList(List<Price> list, int chunkSize) {
    List<List<Price>> chunks = [];

    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
          i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }

    return chunks;
  }

  Widget _buildPriceContainer({required Price price}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(price.title,
              style:
                  _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '₹ ${price.mrp.toString()}',
                style: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryPink,
                    decoration: TextDecoration.lineThrough)),
            WidgetSpan(child: SizedBox(width: 6)),
            TextSpan(
                text: '₹ ${price.offeredPrice} *',
                style: _textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.primaryPink))
          ]))
        ]));
  }
}
