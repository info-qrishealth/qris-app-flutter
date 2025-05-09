import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/models/faq/faq.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';
import 'package:qris_health/modules/home_module/components/cashback_container.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/components/package_tile_horizontal.dart';
import 'package:qris_health/modules/orders_modele/helpers/cart_helper.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_html_text.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/discount_coupon_container.dart';
import 'package:qris_health/shared/components/faq_list_tile.dart';
import 'package:qris_health/shared/components/info_row.dart';
import 'package:qris_health/shared/extensions/included_package_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../constants/enums/test_package_type.dart';
import '../../generated/assets.dart';

class BloodTestDetailScreen extends StatefulWidget {
  final int testId;
  const BloodTestDetailScreen({super.key, required this.testId});

  @override
  State<BloodTestDetailScreen> createState() => _BloodTestDetailScreenState();
}

class _BloodTestDetailScreenState extends State<BloodTestDetailScreen>
    with GeneralHelperMixin {
  final _textTheme = Get.textTheme;
  bool _showMoreText = false;
  TestPackageModel? _testPackageModel;
  late Future<List<Faq>> _faqFuture;
  List<TestPackageModel> _relatedTests = [];

  @override
  void initState() {
    super.initState();
    _faqFuture = TestService.getFaqsByTestId(testId: widget.testId);
  }

  @override
  Widget build(BuildContext context) {
    final List<IncludedPackage> includedPackages = [];

    if (_testPackageModel?.includedPackages != null) {
      final List<IncludedPackage> packages = [];
      final List<IncludedPackage> subPackages = [];
      final List<IncludedPackage> testsTests = [];
      final List<IncludedPackage> otherTests = [];

      for (var test in _testPackageModel!.includedPackages) {
        switch (test.type) {
          case TestPackageType.test:
            testsTests.add(test);
          case TestPackageType.package:
            packages.add(test);
          case TestPackageType.sub_package:
            subPackages.add(test);
          case null:
            otherTests.add(test);
        }
      }

      includedPackages.assignAll(
          [...packages, ...subPackages, ...testsTests, ...otherTests]);
    }

    return Scaffold(
        bottomNavigationBar: _testPackageModel == null
            ? null
            : Column(mainAxisSize: MainAxisSize.min, children: [
                DiscountCouponContainer(),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.scaffoldPadding, vertical: 16),
                    decoration: BoxDecoration(color: AppColors.primaryBlue),
                    child: SafeArea(
                        child: Row(children: [
                      Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 1),
                                child: Text(
                                    '₹ ${_testPackageModel?.specialPrice?.toInt()}',
                                    style: _textTheme.titleLarge!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        decoration:
                                            TextDecoration.lineThrough))),
                            SizedBox(width: 18),
                            Text('₹ ${_testPackageModel?.price} *',
                                style: _textTheme.headlineLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ])),
                      SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_testPackageModel != null) {
                                  await CartHelper.addToCartAndNavigate(
                                      testPackageModel: _testPackageModel!);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: Text('  Book Now  ',
                                  style: _textTheme.titleLarge!
                                      .copyWith(fontWeight: FontWeight.w800))))
                    ]))),
              ]),
        appBar: CommonAppBar(title: 'Details'),
        body: SafeArea(
            child: FutureBuilder<TestPackageModel>(
                future: TestService.getTestByTestId(id: widget.testId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (_testPackageModel == null) {
                      _testPackageModel = snapshot.data;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {});
                      });
                    }

                    return ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.scaffoldPadding),
                        children: [
                          SizedBox(height: 16),
                          PackageListTile(
                              testPackage: _testPackageModel,
                              onSeeDetailsTap: null,
                              onBookNowTap: () async {
                                if (_testPackageModel != null) {
                                  await CartHelper.addToCartAndNavigate(
                                      testPackageModel: _testPackageModel!);
                                }
                              }),
                          SizedBox(height: 18),
                          DottedBorder(
                              strokeWidth: 0.7,
                              borderType: BorderType.RRect,
                              color: AppColors.primaryPink,
                              radius: Radius.circular(8),
                              borderPadding: EdgeInsets.zero,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9, vertical: 9),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryPink
                                          .withOpacity(0.11)),
                                  child: Row(children: [
                                    Expanded(
                                        child: InfoRow(
                                            svgPath: Assets.iconsFoodIcon,
                                            title: 'Fasting Time : ',
                                            description:
                                                '${_testPackageModel!.fastingTime}')),
                                    Expanded(
                                        child: InfoRow(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            svgPath: Assets.iconsClockIcon,
                                            title: 'Report Time : ',
                                            description:
                                                _testPackageModel?.productH3 ??
                                                    'N/A')),
                                  ]))),
                          SizedBox(height: 18),
                          CashbackContainer(),
                          SizedBox(height: 18),
                          Text('Description',
                              style: _textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700)),
                          SizedBox(height: 8),
                          AnimatedSize(
                              duration: Duration(milliseconds: 200),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showMoreText = !_showMoreText;
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black
                                                  .withOpacity(0.09)),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonHtmlText(
                                                text:
                                                    '${_showMoreText ? _testPackageModel!.description : _testPackageModel!.description.getEllipticText(charactersAfterTrim: 250)}',
                                                pStyle: Style(
                                                    color: AppColors.textColor,
                                                    fontSize: FontSize.medium,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12, left: 9),
                                                child: Text(
                                                    _showMoreText
                                                        ? 'Read Less'
                                                        : 'Read More',
                                                    style: _textTheme.bodySmall!
                                                        .copyWith(
                                                            color: AppColors
                                                                .primaryPink,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))),
                                          ])))),
                          SizedBox(height: 18),
                          ContactUsContainer(),
                          SizedBox(height: 18),
                          Text(
                              'Parameters Included - ${_testPackageModel?.customParameterCount}',
                              style: _textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700)),
                          SizedBox(height: 8),
                          if (includedPackages.isNotEmpty)
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryBlue,
                                        width: 0.7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    children: includedPackages
                                        .map((includedPackage) =>
                                            _buildExpansionTile(
                                                includedPackage:
                                                    includedPackage))
                                        .toList())),
                          SizedBox(height: 18),
                          Text('Benefits',
                              style: _textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700)),
                          SizedBox(height: 8),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.09))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildBenefitRow(
                                        title:
                                            'Free Home Sample Collection by Vaccinated Professionals',
                                        assetPath:
                                            Assets.testBenefitIconsCycleIcon),
                                    _buildBenefitRow(
                                        title:
                                            'Free Doctor Consultation from Expert Team',
                                        assetPath:
                                            Assets.testBenefitIconsDoctorIcon),
                                    _buildBenefitRow(
                                        title:
                                            'Doctor verified reports with 3-step review process',
                                        assetPath: Assets
                                            .testBenefitIconsVerifiedBenefitIcon),
                                    _buildBenefitRow(
                                        title:
                                            'Smart Reporting - Detailed information on each test',
                                        assetPath:
                                            Assets.testBenefitIconsSimIcon),
                                    _buildBenefitRow(
                                        title:
                                            'Expert Team of Medical Professionals',
                                        assetPath:
                                            Assets.testBenefitIconsUsersIcon),
                                  ])),
                          SizedBox(height: 18),
                          Text('Frequently Asked Questions',
                              style: _textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700)),
                          SizedBox(height: 8),
                          AnimatedSize(
                              duration: Duration(milliseconds: 200),
                              child: FutureBuilder<List<Faq>>(
                                  future: _faqFuture,
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Container();
                                    }

                                    final faqs = snapshot.data;

                                    return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.09)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                            children: faqs!
                                                .map((faq) =>
                                                    FaqListTile(faq: faq))
                                                .toList()));
                                  })),
                          SizedBox(height: 16),
                          Text('Related blood test packages',
                              style: _textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700)),
                          SizedBox(height: 8),
                          SizedBox(
                              height: 150,
                              child: FutureBuilder<List<TestPackageModel>>(
                                  future: TestService.getTestsByTestIds(
                                      testIds: getIntsFromString(
                                          string:
                                              _testPackageModel!.relatedPro)),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Container();
                                    }

                                    if (_relatedTests.isEmpty) {
                                      _relatedTests = snapshot.data ?? [];
                                    }

                                    return ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final test = _relatedTests[index];

                                          return PackageTileHorizontal(
                                              testPackageModel: test,
                                              onSeeDetailsTap: () async {
                                                Navigator.of(context).push(
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            BloodTestDetailScreen(
                                                                testId:
                                                                    _relatedTests[
                                                                            index]
                                                                        .id)));
                                              });
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(width: 8);
                                        },
                                        itemCount: _relatedTests.length);
                                  })),
                          SizedBox(height: 26),
                        ]);
                  }

                  return CommonListviewShimmer();
                })));
  }

  Widget _buildExpansionTile({required IncludedPackage includedPackage}) {
    return ExpansionTile(
        minTileHeight: 30,
        tilePadding: EdgeInsets.symmetric(horizontal: 10),
        title: Row(children: [
          SizedBox(
              height: 22,
              width: 22,
              child: Image.asset(includedPackage.imagePath,
                  height: 22, width: 22)),
          SizedBox(width: 10),
          Expanded(
              child: Text(
                  '${includedPackage.title!.clean} (${includedPackage.customParameterCount})',
                  style: _textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w400))),
        ]),
        childrenPadding: EdgeInsets.symmetric(horizontal: 9),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        trailing: Icon(Icons.keyboard_arrow_down_outlined,
            color: AppColors.primaryBlue, size: 20),
        children: [
          ...includedPackage.testNames.map((test) => Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(test,
                  style: _textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightSubTextColor)))),
          SizedBox(height: 4),
        ]);
  }

  Widget _buildBenefitRow({required String title, required String assetPath}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          SvgPicture.asset(assetPath),
          SizedBox(width: 8),
          Expanded(
              child: Text(title,
                  style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryPink,
                      fontWeight: FontWeight.w400)))
        ]));
  }
}
