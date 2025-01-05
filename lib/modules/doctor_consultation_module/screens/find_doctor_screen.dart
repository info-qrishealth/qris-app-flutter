import 'package:fancy_search_dropdown/fancy_search_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import 'doctors_list_screen.dart';

class FindDoctorScreen extends StatefulWidget {
  const FindDoctorScreen({super.key});

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  String? _location;
  String? _speciality;
  final _textTheme = Get.textTheme;

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
                    FancySearchDropdown(
                        onSelected: (place) {
                          setState(() {
                            _location = place;
                          });
                        },
                        selectedValue: _location,
                        suggestions: ['Rohini', 'Connaught Place'],
                        config: FancySearchDropdownConfig(
                            activeLeading: _buildLocationPrefixIcon(),
                            inActiveLeading: _buildLocationPrefixIcon(),
                            inActiveSuffix: _buildClearIcon(),
                            activeSuffix: _buildClearIcon(),
                            inputDecoration:
                                InputDecoration(hintText: 'Select Location'),
                            borderRadius: 12,
                            tileBuilder: (context, index, value) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/images/icons/location_icon.svg',
                                      height: 18,
                                      color: AppColors.lightText),
                                  SizedBox(width: 8),
                                  Text('$value',
                                      style: _textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.lightText)),
                                ])))),
                    SizedBox(height: 8),
                    FancySearchDropdown(
                        suggestions: ['Dentist', 'Pediatrician'],
                        selectedValue: _speciality,
                        onSelected: (speciality) {
                          setState(() {
                            _speciality = speciality;
                          });
                        },
                        config: FancySearchDropdownConfig(
                            activeLeading: _buildSearchIcon(),
                            inActiveLeading: _buildSearchIcon(),
                            inActiveSuffix: _buildClearIcon(),
                            activeSuffix: _buildClearIcon(),
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
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => DoctorsListScreen()));
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
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            _speciality = 'General Medicine';
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(children: [
                              SvgPicture.asset(
                                  'assets/images/icons/search_icon.svg',
                                  height: 20,
                                  color: AppColors.lightText),
                              SizedBox(width: 15),
                              Text('General Medicine',
                                  style: _textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightText)),
                            ])));
                  },
                  separatorBuilder: (context, index) {
                    return CommonDivider(height: 1);
                  },
                  itemCount: 15))
        ])));
  }

  Widget _buildClearIcon() {
    return InkWell(
        onTap: () {},
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
}
