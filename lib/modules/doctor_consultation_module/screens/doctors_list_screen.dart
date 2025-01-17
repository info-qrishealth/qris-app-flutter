import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/specialist_type.dart';
import 'package:qris_health/modules/doctor_consultation_module/components/doctor_list_tile.dart';
import 'package:qris_health/modules/doctor_consultation_module/components/select_location_dialog.dart';
import 'package:qris_health/modules/doctor_consultation_module/components/specialist_category_container.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor/doctor.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_category/doctor_category.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_location/doctor_location.dart';
import 'package:qris_health/modules/doctor_consultation_module/services/doctor_service.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/common_outlined_chip.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/navigation_row.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../shared/components/no_item_found_container.dart';

class DoctorsListScreen extends StatefulWidget {
  final DoctorCategory selectedCategory;
  final DoctorLocation selectedLocation;
  final List<DoctorLocation> allLocations;
  final List<DoctorCategory> allCategories;
  const DoctorsListScreen(
      {super.key,
      required this.selectedCategory,
      required this.selectedLocation,
      required this.allLocations,
      required this.allCategories});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final _scrollController = ScrollController();
  late DoctorLocation _selectedLocation;
  late DoctorCategory _selectedCategory;
  List<Doctor> _doctors = [];

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.selectedLocation;
    _selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
            title: '${_selectedCategory.title} in ${_selectedLocation.title}'),
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
                      children: [
                        ...widget.allLocations
                            .where((location) =>
                                location.cityId == _selectedLocation.cityId)
                            .toList()
                            .sublist(
                                0, widget.allLocations.length > 5 ? 5 : null)
                            .map((place) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedLocation = place;
                                  });
                                },
                                child: CommonOutlinedChip(
                                    isSelected:
                                        _selectedLocation.id == place.id,
                                    title: place.title!))),
                        if (widget.allLocations.length > 5)
                          CommonOutlinedChip(
                              onTap: () async {
                                await showDialog(
                                    context: context,
                                    builder: (context) => SelectLocationDialog(
                                        doctorLocations: widget.allLocations,
                                        onApply: (selectedLocation) {
                                          Navigator.of(context).pop();

                                          setState(() {
                                            _selectedLocation =
                                                selectedLocation;
                                          });
                                        },
                                        selectedLocation: _selectedLocation));
                              },
                              isSelected: widget.allLocations
                                      .sublist(0, 5)
                                      .firstWhereOrNull((element) =>
                                          element.id == _selectedLocation.id) ==
                                  null,
                              title: '+ View more'),
                      ])),
              SizedBox(height: 24),
              Expanded(
                  child: FutureBuilder<List<Doctor>>(
                      future: DoctorService.getDoctorsByAreaAndCategory(
                          categoryId: _selectedCategory.id,
                          areaId: _selectedLocation.id),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CommonListviewShimmer();
                        }

                        _doctors = snapshot.data!;

                        if (_doctors.isEmpty) {
                          return NoItemFoundContainer(
                              title: 'No bookings found.');
                        }

                        return ListView(
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
                                    return DoctorListTile(
                                        doctor: _doctors[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    if (index == 1) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Image.asset(
                                              'assets/images/illustrations/doctor_ad_illustration.png'));
                                    } else {
                                      return SizedBox(height: 8);
                                    }
                                  },
                                  itemCount: _doctors.length),
                              SizedBox(height: 24),
                              Row(children: [
                                Expanded(
                                    child: HeadingText(
                                        text: 'Other Specialists in Rohini')),
                                NavigationRow(
                                    onPreviousTap: () async {
                                      await _scrollController.animateTo(
                                          _scrollController.position.pixels -
                                              100,
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                    },
                                    onNextTap: () async {
                                      await _scrollController.animateTo(
                                          _scrollController.position.pixels +
                                              100,
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                    },
                                    activeColor: AppColors.primaryBlue),
                              ]),
                              SizedBox(height: 12),
                              SizedBox(
                                  height: 79,
                                  child: ListView(
                                      controller: _scrollController,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      children: SpecialistType.values
                                          .map((specialist) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child:
                                                  SpecialistCategoryContainer(
                                                      specialistType:
                                                          specialist)))
                                          .toList()))
                            ]);
                      })),
              SizedBox(height: 16),
            ])));
  }
}
