import 'package:fancy_search_dropdown/fancy_search_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_category/doctor_category.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_location/doctor_location.dart';
import 'package:qris_health/modules/doctor_consultation_module/services/doctor_service.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import 'doctors_list_screen.dart';

class FindDoctorScreen extends StatefulWidget {
  const FindDoctorScreen({super.key});

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  final _textTheme = Get.textTheme;

  DoctorCategory? _selectedCategory;
  DoctorLocation? _selectedLocation;

  late Future<List<DoctorCategory>> _doctorCategoriesFuture;
  late Future<List<DoctorLocation>> _doctorLocationFuture;

  List<DoctorCategory> _categories = [];
  List<DoctorLocation> _locations = [];

  @override
  void initState() {
    super.initState();
    _doctorCategoriesFuture = DoctorService.getDoctorCategories();
    _doctorLocationFuture = DoctorService.getDoctorLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.scaffoldPadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24),
                    FutureBuilder<List<DoctorLocation>>(
                        future: _doctorLocationFuture,
                        builder: (context, snapshot) {
                          _locations = snapshot.data ?? [];

                          return FancySearchDropdown(
                              onSelected: (place) {
                                setState(() {
                                  _selectedLocation =
                                      _locations.firstWhereOrNull((category) =>
                                          category.title!.trim() ==
                                          place.trim());
                                });
                              },
                              selectedValue: _selectedLocation?.title,
                              suggestions: _locations
                                  .map((location) => location.title!)
                                  .toList(),
                              config: FancySearchDropdownConfig(
                                  activeLeading: _buildLocationPrefixIcon(),
                                  inActiveLeading: _buildLocationPrefixIcon(),
                                  inActiveSuffix:
                                      _buildClearIcon(onTap: _clearLocation),
                                  activeSuffix:
                                      _buildClearIcon(onTap: _clearLocation),
                                  inputDecoration: InputDecoration(
                                      hintText: 'Select Location'),
                                  borderRadius: 12,
                                  tileBuilder: (context, index, value) =>
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 12),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/location_icon.svg',
                                                height: 18,
                                                color: AppColors.lightText),
                                            SizedBox(width: 8),
                                            Text('$value',
                                                style: _textTheme.bodySmall!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .lightText)),
                                          ]))));
                        }),
                    SizedBox(height: 8),
                    FancySearchDropdown(
                        suggestions: _categories
                            .map((category) => category.title!)
                            .toList(),
                        selectedValue: _selectedCategory?.title,
                        onSelected: (speciality) {
                          setState(() {
                            _selectedCategory = _categories.firstWhereOrNull(
                                (category) =>
                                    category.title!.trim() ==
                                    speciality.trim());
                          });
                        },
                        config: FancySearchDropdownConfig(
                            activeLeading: _buildSearchIcon(),
                            inActiveLeading: _buildSearchIcon(),
                            inActiveSuffix:
                                _buildClearIcon(onTap: _clearCategory),
                            activeSuffix:
                                _buildClearIcon(onTap: _clearCategory),
                            inputDecoration:
                                InputDecoration(hintText: 'Select Specialty'),
                            borderRadius: 12,
                            tileBuilder: (context, index, value) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/images/icons/search_icon.svg',
                                      height: 18,
                                      color: AppColors.lightText),
                                  SizedBox(width: 8),
                                  Text('$value',
                                      style: _textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.lightText)),
                                ])))),
                    SizedBox(height: 8),
                    SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue),
                            onPressed: () {
                              if (_selectedCategory == null ||
                                  _selectedLocation == null) {
                                return AppConstants.showSnackbar(
                                    text:
                                        'Please select location and speciality for doctors',
                                    type: SnackbarType.warning);
                              }

                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => DoctorsListScreen(
                                      selectedCategory: _selectedCategory!,
                                      selectedLocation: _selectedLocation!,
                                      allLocations: _locations,
                                      allCategories: _categories)));
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/icons/search_icon.svg',
                                      color: Colors.white,
                                      height: 18,
                                      width: 18),
                                  SizedBox(width: 12),
                                  Text('Search',
                                      style: _textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ]))),
                    SizedBox(height: 18),
                    HeadingText(text: 'Common Specialties'),
                    SizedBox(height: 18),
                  ])),
          Expanded(
              child: FutureBuilder<List<DoctorCategory>>(
                  future: _doctorCategoriesFuture,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CommonListviewShimmer();
                    }

                    final doctorCategories = snapshot.data!;

                    if (_categories.isEmpty) {
                      _categories = doctorCategories;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {});
                      });
                    }

                    return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.scaffoldPadding),
                        itemBuilder: (context, index) {
                          final doctorCategory = doctorCategories[index];

                          return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedCategory = doctorCategory;
                                });
                              },
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  child: Row(children: [
                                    SvgPicture.asset(
                                        'assets/images/icons/search_icon.svg',
                                        height: 20,
                                        color: AppColors.lightText),
                                    SizedBox(width: 15),
                                    Text(doctorCategory.title!.trim(),
                                        style: _textTheme.bodyLarge!.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.lightText)),
                                  ])));
                        },
                        separatorBuilder: (context, index) {
                          return CommonDivider(height: 1);
                        },
                        itemCount: doctorCategories.length);
                  }))
        ])));
  }

  Widget _buildClearIcon({required Function() onTap}) {
    return InkWell(
        onTap: onTap,
        child: Icon(Icons.clear, size: 16, color: AppColors.lightSubTextColor));
  }

  Widget _buildLocationPrefixIcon() {
    return UnconstrainedBox(
        child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset('assets/images/icons/location_icon.svg',
                height: 20, width: 20, color: AppColors.lightSubTextColor)));
  }

  Widget _buildSearchIcon() {
    return UnconstrainedBox(
        child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset('assets/images/icons/search_icon.svg',
                height: 18, width: 18, color: AppColors.lightSubTextColor)));
  }

  void _clearLocation() {
    _selectedLocation = null;
    setState(() {});
  }

  void _clearCategory() {
    _selectedCategory = null;
    setState(() {});
  }
}
