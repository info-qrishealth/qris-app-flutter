import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/components/category_container.dart';
import 'package:qris_health/modules/home_module/components/home_screen_app_bar.dart';
import 'package:qris_health/modules/home_module/components/package_tile.dart';
import 'package:qris_health/modules/home_module/components/test_and_scan_tile.dart';
import 'package:qris_health/modules/home_module/enum/test_category.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/home_module/screens/search_package_screen.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/main_drawer.dart';
import 'package:qris_health/shared/components/outlined_icon_button.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/cashback_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textTheme = Get.textTheme;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MainDrawer(),
        appBar: HomeScreenAppBar(scaffoldKey: _scaffoldKey),
        body: SafeArea(
            child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    vertical: 16, horizontal: AppConstants.scaffoldPadding),
                children: [
              FilterTextField(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SearchPackageScreen()));
                  },
                  onFieldSubmitted: null,
                  controller: _searchController,
                  onChanged: null,
                  hintText: 'Search for Blood tests / Packages....',
                  suffixIcon: null),
              SizedBox(height: 24),
              Row(
                  children: List.generate(4, (index) {
                final category = TestCategory.values[index];

                return Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CategoryContainer(testCategory: category)));
              })),
              SizedBox(height: 50),
              Row(
                  children: List.generate(4, (i) {
                final index = i + 4;
                final category = TestCategory.values[index];

                return Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CategoryContainer(testCategory: category)));
              })),
              SizedBox(height: 45),
              CashbackContainer(),
              SizedBox(height: 18),
              _buildHeadingRow(
                  title: 'Popular blood test packages',
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => PopularPackageScreen()));
                  }),
              SizedBox(height: 12),
              SizedBox(
                  height: 145,
                  child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return PackageTileHorizontal();
                      })),
              SizedBox(height: 16),
              ContactUsContainer(),
              SizedBox(height: 16),
              _buildHeadingRow(
                  title: 'Popular Imaging Tests and Scans', onTap: null),
              SizedBox(height: 12),
              SizedBox(
                  height: 115,
                  width: 145,
                  child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return TestAndScanTile();
                      })),
              SizedBox(height: 18),
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SvgPicture.asset(
                        'assets/images/illustrations/refer_and_earn_banner.svg',
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 18),
              Text('Our Accreditations',
                  style: _textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700, color: Color(0xFF707B81)),
                  textAlign: TextAlign.center),
              SizedBox(height: 18),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _buildCreditImage(
                    path: 'assets/images/icons/accreditations/nabl.png'),
                SizedBox(width: 16),
                _buildCreditImage(
                    path: 'assets/images/icons/accreditations/ilac.png'),
                SizedBox(width: 16),
                _buildCreditImage(
                    path: 'assets/images/icons/accreditations/minister.png'),
              ]),
              SizedBox(height: 16),
            ])));
  }

  Widget _buildHeadingRow({required String title, required Function()? onTap}) {
    return Row(children: [
      Expanded(
          child: Text(title,
              style: _textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w700))),
      if (onTap != null)
        OutlinedIconButton(
            onTap: onTap,
            icon: Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.primaryBlue, size: 16)),
    ]);
  }

  Widget _buildCreditImage({required String path}) {
    return Image.asset(path, height: 65);
  }
}
