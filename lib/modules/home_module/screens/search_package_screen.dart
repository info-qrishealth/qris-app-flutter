import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';

import '../../../shared/components/common_app_bar.dart';

class SearchPackageScreen extends StatefulWidget {
  const SearchPackageScreen({super.key});

  @override
  State<SearchPackageScreen> createState() => _SearchPackageScreenState();
}

class _SearchPackageScreenState extends State<SearchPackageScreen> {
  final _textTheme = Get.textTheme;
  final _searchController = TextEditingController();

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
                      FilterTextField(
                          onFieldSubmitted: (value) {},
                          controller: _searchController,
                          onChanged: (value) {},
                          hintText: 'Search for Blood tests / Packages...',
                          suffixIcon: null),
                      SizedBox(height: 14),
                      ContactUsContainer(),
                      SizedBox(height: 19),
                      Text('Most searched packages',
                          style: _textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.start),
                      Expanded(
                          child: ListView.separated(
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SizedBox(height: 10);
                              },
                              separatorBuilder: (context, index) {
                                return PackageListTile(
                                    onSeeDetailsTap: () {},
                                    onBookNowTap: () {});
                              },
                              itemCount: 10)),
                    ]))));
  }
}
