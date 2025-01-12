import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/cubits/tests_category_cubit.dart';
import 'package:qris_health/modules/all_scans_module/models/test_category_model/test_category_model.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';
import 'package:qris_health/modules/cart_module/screens/cart_screen.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/components/discount_coupon_container.dart';
import 'package:qris_health/shared/components/shimmer_tile.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../screens/blood_test_detail_screen.dart';

class PopularPackageScreen extends StatefulWidget {
  const PopularPackageScreen({super.key});

  @override
  State<PopularPackageScreen> createState() => _PopularPackageScreenState();
}

class _PopularPackageScreenState extends State<PopularPackageScreen> {
  final _textTheme = Get.textTheme;
  TestCategoryModel? _selectedTestType;

  @override
  void initState() {
    super.initState();
    final testCategoriesCubit = BlocProvider.of<TestsCategoryCubit>(context);

    if (testCategoriesCubit.state is! TestsCategoryLoaded) {
      testCategoriesCubit.getTestsCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: DiscountCouponContainer(),
        appBar: CommonAppBar(title: _selectedTestType?.title ?? 'Popular'),
        body:
            SafeArea(child: BlocBuilder<TestsCategoryCubit, TestsCategoryState>(
          builder: (context, state) {
            if (state is TestsCategoryLoaded) {
              return Column(children: [
                SizedBox(height: 18),
                SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      SizedBox(width: AppConstants.scaffoldPadding),
                      GestureDetector(
                          onTap: () {
                            _selectedTestType = null;
                            setState(() {});
                          },
                          child: Column(children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: _selectedTestType == null
                                        ? Color(0x14B23C97)
                                        : Colors.white,
                                    border: Border.all(
                                        width: 0.9,
                                        color: _selectedTestType == null
                                            ? AppColors.primaryPink
                                            : Colors.black.withOpacity(0.09)),
                                    borderRadius: BorderRadius.circular(17)),
                                padding: EdgeInsets.all(14),
                                child: Image.asset(
                                    'assets/images/icons/popular_packages_type/popular_icon.png',
                                    height: 32,
                                    width: 32)),
                            SizedBox(height: 4),
                            Text('Most Popular',
                                style: _textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w500))
                          ])),
                      SizedBox(width: 18),
                      ...state.categories.map((category) => Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: _buildCategoryContainer(
                              testCategoryModel: category))),
                    ])),
                SizedBox(height: 28),
                Expanded(
                    child: FutureBuilder<List<TestPackageModel>>(
                        future: TestService.getPopularTests(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final tests = snapshot.data!;

                            return ListView.separated(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: AppConstants.scaffoldPadding,
                                    right: AppConstants.scaffoldPadding,
                                    bottom: 16),
                                itemBuilder: (context, index) {
                                  return PackageListTile(
                                      testPackage: tests[index],
                                      description:
                                          'Included : Liver Test, Kidney Test, Blood glucose fasting, Lipid profile, Thyroid Profile, HBA1C, Urine Test....',
                                      onSeeDetailsTap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    BloodTestDetailScreen()));
                                      },
                                      onBookNowTap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    CartScreen()));
                                      });
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 15);
                                },
                                itemCount: 10);
                          }

                          return ListView(
                              children: List.generate(8, (index) {
                            return ShimmerTile();
                          }));
                        })),
              ]);
            } else {
              return ListView(
                  children: List.generate(8, (index) {
                return ShimmerTile();
              }));
            }
          },
        )));
  }

  Widget _buildCategoryContainer(
      {required TestCategoryModel testCategoryModel}) {
    final isSelected = testCategoryModel.id == _selectedTestType?.id;

    return GestureDetector(
        onTap: () {
          _selectedTestType = testCategoryModel;
          setState(() {});
        },
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  color: isSelected ? Color(0x14B23C97) : Colors.white,
                  border: Border.all(
                      width: 0.9,
                      color: isSelected
                          ? AppColors.primaryPink
                          : Colors.black.withOpacity(0.09)),
                  borderRadius: BorderRadius.circular(17)),
              padding: EdgeInsets.all(14),
              child: CommonNetworkImage(
                  name: testCategoryModel.pic, height: 32, width: 32)),
          SizedBox(height: 4),
          Text(testCategoryModel.title,
              style:
                  _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500))
        ]));
  }
}
