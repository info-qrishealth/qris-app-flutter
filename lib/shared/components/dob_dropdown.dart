import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/month.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../styles/app_colors.dart';

class DobDropdown extends StatefulWidget {
  final bool isRequired;
  final DateTime? selectedDate;
  final Function(DateTime) getSelectedDate;
  const DobDropdown(
      {super.key,
      this.isRequired = false,
      this.selectedDate,
      required this.getSelectedDate});

  @override
  State<DobDropdown> createState() => _DobDropdownState();
}

class _DobDropdownState extends State<DobDropdown> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      RichText(
          text: TextSpan(
              style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.textColor),
              children: [
            TextSpan(text: ' Date of Birth'),
            if (widget.isRequired)
              TextSpan(text: ' *', style: TextStyle(color: AppColors.red)),
          ])),
      SizedBox(height: 12),
      GestureDetector(
          onTap: () async {
            final pickedDate = await showDatePicker(
                context: context,
                initialDate: widget.selectedDate,
                firstDate: DateTime(1930),
                lastDate: DateTime.now());

            if (pickedDate != null) {
              widget.getSelectedDate(pickedDate);
            }
          },
          child: InputDecorator(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 4)),
              child: Row(children: [
                Expanded(
                    child: DropdownButton(
                        value: widget.selectedDate?.day,
                        underline: Container(),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: 20, color: AppColors.lightSubTextColor),
                        hint: Text('Date',
                            style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.black45)),
                        items: List.generate(31, (index) {
                          final date = index + 1;

                          return DropdownMenuItem(
                              value: index + 1, child: Text(date.toString()));
                        }),
                        onChanged: null)),
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: DropdownButton<Month>(
                            value: widget.selectedDate == null
                                ? null
                                : Month.values[widget.selectedDate!.month],
                            underline: Container(),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: 20, color: AppColors.lightGrey),
                            hint: Text('Month',
                                style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black45)),
                            items: Month.values
                                .map((month) => DropdownMenuItem(
                                    value: month,
                                    child: Text(month.name.formattedEnumName!)))
                                .toList(),
                            onChanged: null))),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButton<int>(
                            value: widget.selectedDate?.year,
                            underline: Container(),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: 20, color: AppColors.lightGrey),
                            hint: Text('Year',
                                style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black45)),
                            items: List.generate(100, (index) {
                              final currentYear = DateTime.now().year;
                              final date = currentYear - index;

                              return DropdownMenuItem<int>(
                                  value: date, child: Text(date.toString()));
                            }),
                            onChanged: null))),
              ]))),
    ]);
  }
}
