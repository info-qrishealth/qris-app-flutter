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
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/components/discount_coupon_container.dart';
import 'package:qris_health/shared/components/shimmer_tile.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../screens/blood_test_detail_screen.dart';

class PopularPackageScreen extends StatefulWidget {
  final bool showBottomStrip;
  const PopularPackageScreen({super.key, this.showBottomStrip = true});

  @override
  State<PopularPackageScreen> createState() => _PopularPackageScreenState();
}

class _PopularPackageScreenState extends State<PopularPackageScreen> {
  final _textTheme = Get.textTheme;
  TestCategoryModel? _selectedTestCategory;

  @override
  void initState() {
    super.initState();
    final testCategoriesCubit = BlocProvider.of<TestsCategoryCubit>(context);
    final popularPackagesCubit = BlocProvider.of<PopularPackagesCubit>(context);

    if (testCategoriesCubit.state is! TestsCategoryLoaded) {
      testCategoriesCubit.getTestsCategories();
    }

    if (popularPackagesCubit.state is! PopularPackagesLoaded) {
      popularPackagesCubit.getPopularPackages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            widget.showBottomStrip ? DiscountCouponContainer() : null,
        appBar: CommonAppBar(title: _selectedTestCategory?.title ?? 'Popular'),
        body: SafeArea(child:
            BlocBuilder<TestsCategoryCubit, TestsCategoryState>(
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
                          _selectedTestCategory = null;
                          setState(() {});
                        },
                        child: Column(children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: _selectedTestCategory == null
                                      ? Color(0x14B23C97)
                                      : Colors.white,
                                  border: Border.all(
                                      width: 0.9,
                                      color: _selectedTestCategory == null
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
                    ...state.categories.map((category) => GestureDetector(
                        onTap: () async {
                          setState(() {
                            _selectedTestCategory = category;
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(right: 18),
                            child: _buildCategoryContainer(
                                testCategoryModel: category)))),
                  ])),
              SizedBox(height: 28),
              Expanded(
                  child: BlocBuilder<PopularPackagesCubit,
                          PopularPackagesState>(
                      buildWhen: (p, c) =>
                          p.popularPackages != c.popularPackages,
                      builder: (context, state) {
                        if (_selectedTestCategory == null) {
                          if (state is PopularPackagesLoaded) {
                            final tests = state.popularPackages;

                            return ListView.separated(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: AppConstants.scaffoldPadding,
                                    right: AppConstants.scaffoldPadding,
                                    bottom: 16),
                                itemBuilder: (context, index) {
                                  final test = tests[index];
                                  return PackageListTile(
                                      testPackage: test,
                                      onSeeDetailsTap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    BloodTestDetailScreen(
                                                        testId: test.id)));
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
                                itemCount: tests.length);
                          }
                          return CommonListviewShimmer();
                        } else {
                          return FutureBuilder<List<TestPackageModel>>(
                              future: TestService.getPackagesByCategory(
                                  categoryId: _selectedTestCategory!.id),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CommonListviewShimmer();
                                }

                                if (snapshot.hasData) {
                                  final tests =
                                      snapshot.data!.reversed.toList();

                                  return ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.only(
                                          left: AppConstants.scaffoldPadding,
                                          right: AppConstants.scaffoldPadding,
                                          bottom: 16),
                                      itemBuilder: (context, index) {
                                        final test = tests[index];
                                        return PackageListTile(
                                            testPackage: test,
                                            onSeeDetailsTap: () {
                                              Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          BloodTestDetailScreen(
                                                              testId:
                                                                  test.id)));
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
                                      itemCount: tests.length);
                                }

                                return CommonListviewShimmer();
                              });
                        }
                      })),
            ]);
          } else {
            return ListView(
                children: List.generate(8, (index) {
              return ShimmerTile();
            }));
          }
        })));
  }

  Widget _buildCategoryContainer(
      {required TestCategoryModel testCategoryModel}) {
    final isSelected = testCategoryModel.id == _selectedTestCategory?.id;

    return GestureDetector(
        onTap: () {
          _selectedTestCategory = testCategoryModel;
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
