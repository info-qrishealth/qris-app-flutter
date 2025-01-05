import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/doctor_consultation_module/components/doctor_list_tile.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_outlined_chip.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/navigation_row.dart';
import 'package:qris_health/styles/app_colors.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  String? _place;
  final _places = [
    'Rohini',
    'Sarita Vihar',
    'Shahdara',
    'Laxmi nagar',
    'Gandhi Nagar'
  ];

  @override
  void initState() {
    super.initState();
    _place = _places.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Dentists in Rohini'),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding),
                  child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 8,
                      runSpacing: 8,
                      children: _places
                          .map((place) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _place = place;
                                });
                              },
                              child: CommonOutlinedChip(
                                  isSelected: place == _place, title: place)))
                          .toList())),
              SizedBox(height: 24),
              Expanded(
                  child: ListView(
                      padding: EdgeInsets.only(
                          left: AppConstants.scaffoldPadding,
                          right: AppConstants.scaffoldPadding,
                          bottom: 16),
                      physics: BouncingScrollPhysics(),
                      children: [
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DoctorListTile();
                        },
                        separatorBuilder: (context, index) {
                          if (index == 1) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Image.asset(
                                    'assets/images/illustrations/doctor_ad_illustration.png'));
                          } else {
                            return SizedBox(height: 8);
                          }
                        },
                        itemCount: 10),
                    SizedBox(height: 24),
                    Row(children: [
                      Expanded(
                          child:
                              HeadingText(text: 'Other Specialists in Rohini')),
                      NavigationRow(
                          onPreviousTap: () {},
                          onNextTap: () {},
                          activeColor: AppColors.primaryBlue),
                    ]),
                    SizedBox(height: 12),
                  ])),
            ])));
  }
}
