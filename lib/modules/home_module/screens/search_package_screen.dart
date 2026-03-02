import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/test_package_type.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/orders_modele/helpers/cart_helper.dart';
import 'package:qris_health/modules/screens/blood_test_detail_screen.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';

import '../../../shared/components/common_app_bar.dart';

class SearchPackageScreen extends StatefulWidget {
  const SearchPackageScreen({super.key});

  @override
  State<SearchPackageScreen> createState() => _SearchPackageScreenState();
}

class _SearchPackageScreenState extends State<SearchPackageScreen>
    with GeneralHelperMixin {
  late final Future<List<TestPackageModel>> _testsFuture;
  final _searchController = TextEditingController();
  List<TestPackageModel>? _testsToShow;
  String _currentSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _testsFuture = TestService.getAllTests();
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      _testsToShow = null;
      _currentSearchQuery = '';
      setState(() {});
      return;
    }

    TestService.trackTestSearch(searchQuery: query);
    _currentSearchQuery = query;

    _testsFuture.then((snapshot) {
      final allPackages = _getValidPackages(tests: snapshot);
      final List<TestPackageModel> packages = [];

      if (query.isNumeric) {
        packages.addAll(allPackages
            .where((element) => element.id.toString() == query)
            .toList());
      }

      packages.addAll(allPackages.where((element) {
        return element.title!.toLowerCase().contains(query.toLowerCase());
      }).toList());

      setState(() {
        _testsToShow = packages.toSet().toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Search'),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                child: FutureBuilder<List<TestPackageModel>>(
                    future: _testsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CommonListviewShimmer();
                      }

                      if (snapshot.hasData && _testsToShow == null) {
                        _testsToShow = _getValidPackages(tests: snapshot.data!);
                      }

                      final List<TestPackageModel> packages = [];
                      final List<TestPackageModel> subPackages = [];
                      final List<TestPackageModel> tests = [];
                      final List<TestPackageModel> otherTests = [];

                      for (var test in _testsToShow!) {
                        switch (test.type) {
                          case TestPackageType.test:
                            tests.add(test);
                          case TestPackageType.package:
                            packages.add(test);
                          case TestPackageType.sub_package:
                            subPackages.add(test);
                          case null:
                            otherTests.add(test);
                        }
                      }

                      _testsToShow!.assignAll([
                        ...packages,
                        ...subPackages,
                        ...tests,
                        ...otherTests
                      ]);

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            BlocBuilder<PopularPackagesCubit,
                                    PopularPackagesState>(
                                builder: (context, state) {
                              return FilterTextField(
                                  onFieldSubmitted: (value) {
                                    _performSearch(value);
                                  },
                                  controller: _searchController,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      _testsToShow = null;
                                      _currentSearchQuery = '';
                                      setState(() {});
                                      return;
                                    }

                                    _currentSearchQuery = value;

                                    final allPackages = _getValidPackages(
                                        tests: snapshot.data!);
                                    final List<TestPackageModel> packages = [];

                                    if (value.isNumeric) {
                                      packages.addAll(allPackages
                                          .where((element) =>
                                              element.id.toString() == value)
                                          .toList());
                                    }

                                    packages
                                        .addAll(allPackages.where((element) {
                                      return element.title!
                                          .toLowerCase()
                                          .contains(value.toLowerCase());
                                    }).toList());

                                    _testsToShow = packages.toSet().toList();
                                    setState(() {});
                                  },
                                  hintText:
                                      'Search for Blood tests / Packages...',
                                  suffixIcon: null);
                            }),
                            SizedBox(height: 14),
                            ContactUsContainer(),
                            SizedBox(height: 19),
                            if (snapshot.hasData)
                              if (_testsToShow!.isEmpty)
                                Expanded(
                                    child: Center(
                                        child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: NoItemFoundContainer(
                                                title: 'No item found'))))
                              else
                                Expanded(child: BlocBuilder<
                                        PopularPackagesCubit,
                                        PopularPackagesState>(
                                    builder: (context, state) {
                                  return ListView.separated(
                                      keyboardDismissBehavior:
                                          ScrollViewKeyboardDismissBehavior
                                              .onDrag,
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return PackageListTile(
                                            testPackage: _testsToShow![index],
                                            onSeeDetailsTap: () {
                                              Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          BloodTestDetailScreen(
                                                              testId:
                                                                  _testsToShow![
                                                                          index]
                                                                      .id,
                                                              searchQuery: _currentSearchQuery.isNotEmpty ? _currentSearchQuery : null)));
                                            },
                                            onBookNowTap: () async {
                                              await CartHelper
                                                  .addToCartAndNavigate(
                                                      testPackageModel:
                                                          _testsToShow![index]);
                                            });
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 10);
                                      },
                                      itemCount: _testsToShow!.length);
                                }))
                            else
                              CommonListviewShimmer()
                          ]);
                    }))));
  }

  List<TestPackageModel> _getValidPackages(
      {required List<TestPackageModel> tests}) {
    return tests.where((element) {
      if (element.status == '1' && element.disallowed == 0) {
        if (element.wellness == '1') {
          return false;
        }

        if (element.scanType == '0') {
          return true;
        }
      }

      return false;
    }).toList();
  }
}
