import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class TimeSlotTab extends StatefulWidget {
  final Function() onContinue;
  const TimeSlotTab({super.key, required this.onContinue});

  @override
  State<TimeSlotTab> createState() => _TimeSlotTabState();
}

class _TimeSlotTabState extends State<TimeSlotTab> {
  final _textTheme = Get.textTheme;
  DateTime? _selectedDateTime;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: ListView(physics: BouncingScrollPhysics(), children: [
        SizedBox(height: 8),
        HeadingText(text: 'Add Collection Date & Time'),
        SizedBox(height: 16),
        SizedBox(
            height: 75,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dateTime =
                      DateTime.now().add(Duration(days: index + 1));

                  return _buildDateTile(dateTime);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12);
                },
                itemCount: 7)),
        SizedBox(height: 24),
        CommonDivider(),
        SizedBox(height: 18),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 16,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 8,
                childAspectRatio: 4,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final fromTime =
                  DateTime.now().copyWith(hour: 6 + index, minute: 0);
              final toTime = fromTime.add(Duration(hours: 1));
              final isSelected = _selectedTime?.hour == fromTime.hour &&
                  _selectedTime?.minute == fromTime.minute;

              return InkWell(
                  onTap: () {
                    _selectedTime =
                        TimeOfDay(hour: fromTime.hour, minute: fromTime.minute);

                    setState(() {});
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              isSelected ? AppColors.primaryPink : Colors.white,
                          border: Border.all(
                              color: AppColors.lightGrey, width: 0.7)),
                      child: Text(
                          '${DateFormat().add_jm().format(fromTime)} - ${DateFormat().add_jm().format(toTime)}',
                          style: _textTheme.bodySmall!.copyWith(
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.lightText))));
            }),
      ])),
      SizedBox(height: 16),
      ElevatedButton(
          onPressed: _selectedDateTime == null || _selectedTime == null
              ? null
              : widget.onContinue,
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
          child: Text('Continue')),
      SizedBox(height: 16)
    ]);
  }

  Widget _buildDateTile(DateTime dateTime) {
    final isSelected = dateTime.isEqualDayTo(_selectedDateTime);

    return InkWell(
        onTap: () {
          setState(() {
            _selectedDateTime = dateTime;
          });
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryPink : null,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: isSelected
                        ? Colors.white
                        : Colors.black.withOpacity(0.09))),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(DateFormat().add_E().format(dateTime),
                  style: _textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : null)),
              Spacer(),
              Text('${dateTime.day}',
                  style: _textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : null)),
              Spacer(),
              Text(DateFormat().add_MMM().format(dateTime),
                  style: _textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : null))
            ])));
  }
}
