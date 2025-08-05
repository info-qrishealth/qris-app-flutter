import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/home_module/components/chronic_disease_card.dart';
import 'package:qris_health/modules/home_module/components/health_scrore_card.dart';
import 'package:qris_health/modules/home_module/components/home_screen_carausel.dart';
import 'package:qris_health/modules/home_module/components/home_screen_category_container.dart';
import 'package:qris_health/modules/home_module/components/home_screen_app_bar.dart';
import 'package:qris_health/modules/home_module/components/home_screen_nav_bar.dart';
import 'package:qris_health/modules/home_module/components/package_tile_horizontal.dart';
import 'package:qris_health/modules/home_module/components/upload_prescription_home_screen_container.dart';
import 'package:qris_health/modules/home_module/enum/test_category.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/home_module/screens/search_package_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/refer_and_earn_screen.dart';
import 'package:qris_health/modules/screens/blood_test_detail_screen.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/main_drawer.dart';
import 'package:qris_health/shared/components/outlined_icon_button.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../constants/enums/subscan_type.dart';
import '../../all_scans_module/components/subscan_list_tile_horizontal.dart';
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
  void initState() {
    super.initState();
    Permission.notification.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: HomeScreenNavBar(),
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
                  readOnly: true,
                  hintText: 'Search for Blood tests / Packages....',
                  suffixIcon: null),
              SizedBox(height: 24),
              GridView.count(
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 28,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: TestCategory.values
                      .map((element) =>
                          HomeScreenCategoryContainer(testCategory: element))
                      .toList()),
              SizedBox(height: 28),
              HealthScoreCard(),
              SizedBox(height: 16),
              ChronicDiseaseCard(),
              SizedBox(height: 16),
              UploadPrescriptionHomeScreenContainer(),
              SizedBox(height: 16),
              CashbackContainer(),
              SizedBox(height: 16),
              HomeScreenCarousel(),
              SizedBox(height: 16),
              _buildHeadingRow(
                  title: 'Popular blood test packages',
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => PopularPackageScreen()));
                  }),
              SizedBox(height: 12),
              BlocBuilder<PopularPackagesCubit, PopularPackagesState>(
                  builder: (context, state) {
                if (state is PopularPackagesLoaded) {
                  final packages = state.popularPackages;

                  return SizedBox(
                      height: 150,
                      child: ListView.separated(
                          itemCount: packages.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            return PackageTileHorizontal(
                                testPackageModel: packages[index],
                                onSeeDetailsTap: () async {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) =>
                                          BloodTestDetailScreen(
                                              testId: packages[index].id)));
                                });
                          }));
                }

                return FadeShimmer(
                    width: double.infinity,
                    height: 145,
                    fadeTheme: FadeTheme.light,
                    radius: 16);
              }),
              SizedBox(height: 16),
              ContactUsContainer(),
              SizedBox(height: 16),
              _buildHeadingRow(
                  title: 'Popular Imaging Tests and Scans', onTap: null),
              SizedBox(height: 12),
              SizedBox(
                  height: GetPlatform.isAndroid ? 140 : 150,
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
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => ReferAndEarnScreen()));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SvgPicture.asset(
                          Assets.illustrationsReferAndEarnBanner,
                          fit: BoxFit.fitWidth))),
              SizedBox(height: 18),
              Text('Our Accreditations',
                  style: _textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700, color: Color(0xFF707B81)),
                  textAlign: TextAlign.center),
              SizedBox(height: 18),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _buildCreditImage(path: Assets.accreditationsNabl),
                SizedBox(width: 16),
                _buildCreditImage(path: Assets.accreditationsIlac),
                SizedBox(width: 16),
                _buildCreditImage(path: Assets.accreditationsMinister),
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
    return Opacity(opacity: 0.65, child: Image.asset(path, height: 65));
  }
}
