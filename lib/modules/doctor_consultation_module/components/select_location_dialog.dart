import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_location/doctor_location.dart';
import 'package:qris_health/shared/components/common_outlined_chip.dart';
import 'package:qris_health/styles/app_colors.dart';

class SelectLocationDialog extends StatefulWidget {
  final Function(DoctorLocation) onApply;
  final List<DoctorLocation> doctorLocations;
  final DoctorLocation selectedLocation;
  const SelectLocationDialog(
      {super.key,
      required this.doctorLocations,
      required this.onApply,
      required this.selectedLocation});

  @override
  State<SelectLocationDialog> createState() => _SelectLocationDialogState();
}

class _SelectLocationDialogState extends State<SelectLocationDialog> {
  final _textTheme = Get.textTheme;
  late DoctorLocation _selectedLocation;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.selectedLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Select Location',
                  style: _textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 14),
              Expanded(
                  child: SingleChildScrollView(
                      child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.doctorLocations
                              .map((location) => CommonOutlinedChip(
                                  onTap: () {
                                    setState(() {
                                      _selectedLocation = location;
                                    });
                                  },
                                  isSelected:
                                      _selectedLocation.id == location.id,
                                  title: '${location.title}'))
                              .toList()))),
              SizedBox(height: 16),
              SizedBox(
                  height: 40,
                  child: Row(children: [
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.borderColor)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel',
                                style: _textTheme.bodyLarge!.copyWith(
                                    color: AppColors.lightSubTextColor,
                                    fontWeight: FontWeight.w500)))),
                    SizedBox(width: 10),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () => widget.onApply(_selectedLocation),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue),
                            child: Text('Apply',
                                style: _textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))))
                  ])),
            ])));
  }
}
