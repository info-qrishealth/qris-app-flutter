import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/screens/blood_test_detail_screen.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';

import '../../../shared/components/common_app_bar.dart';
import '../../cart_module/screens/cart_screen.dart';

class SearchPackageScreen extends StatefulWidget {
  const SearchPackageScreen({super.key});

  @override
  State<SearchPackageScreen> createState() => _SearchPackageScreenState();
}

class _SearchPackageScreenState extends State<SearchPackageScreen> {
  final _textTheme = Get.textTheme;
  final _searchController = TextEditingController();
  List<TestPackageModel> _packagesToShow = [];

  @override
  void initState() {
    super.initState();
    final popularPackagesCubit = BlocProvider.of<PopularPackagesCubit>(context);
    if (popularPackagesCubit.state is! PopularPackagesLoaded) {
      popularPackagesCubit.getPopularPackages();
    }

    _packagesToShow = popularPackagesCubit.state.popularPackages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Search'),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      BlocBuilder<PopularPackagesCubit, PopularPackagesState>(
                          builder: (context, state) {
                        return FilterTextField(
                            onFieldSubmitted: (value) {},
                            controller: _searchController,
                            onChanged: (value) {
                              _packagesToShow = value.isEmpty
                                  ? state.popularPackages
                                  : state.popularPackages
                                      .where((element) => element.title!
                                          .toLowerCase()
                                          .contains(value))
                                      .toList();
                              setState(() {});
                            },
                            hintText: 'Search for Blood tests / Packages...',
                            suffixIcon: null);
                      }),
                      SizedBox(height: 14),
                      ContactUsContainer(),
                      SizedBox(height: 19),
                      Text('Most searched packages',
                          style: _textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.start),
                      SizedBox(height: 8),
                      Expanded(child: BlocBuilder<PopularPackagesCubit,
                          PopularPackagesState>(
                        builder: (context, state) {
                          if (state is PopularPackagesLoading) {
                            return CommonListviewShimmer();
                          }

                          if (_searchController.text.isEmpty) {
                            _packagesToShow = state.popularPackages;
                          }

                          if (_packagesToShow.isEmpty) {
                            return Center(
                                child: NoItemFoundContainer(
                                    title: 'No packages found'));
                          }

                          return ListView.separated(
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SizedBox(height: 10);
                              },
                              separatorBuilder: (context, index) {
                                return PackageListTile(
                                    testPackage: _packagesToShow[index],
                                    onSeeDetailsTap: () {
                                      Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  BloodTestDetailScreen(
                                                      testId:
                                                          _packagesToShow[index]
                                                              .id)));
                                    },
                                    onBookNowTap: () {
                                      Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  CartScreen()));
                                    });
                              },
                              itemCount: _packagesToShow.length);
                        },
                      )),
                    ]))));
  }
}
