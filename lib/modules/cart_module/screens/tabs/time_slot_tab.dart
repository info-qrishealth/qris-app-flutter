import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../orders_modele/models/time_slot/time_slot.dart';

class TimeSlotTab extends StatefulWidget {
  final Function() onContinue;
  const TimeSlotTab({super.key, required this.onContinue});

  @override
  State<TimeSlotTab> createState() => _TimeSlotTabState();
}

class _TimeSlotTabState extends State<TimeSlotTab> {
  final _textTheme = Get.textTheme;
  late Future<List<TimeSlot>> _timeSlotFuture;

  @override
  void initState() {
    super.initState();
    final cartCubit = BlocProvider.of<CartCubit>(context);

    if (cartCubit.state.cart.collectionDate == null) {
      cartCubit.updateCollectionDate(DateTime.now());
    }

    _initializeTimeSlotFuture();
  }

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
            child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final dateTime = DateTime.now().add(Duration(days: index));
                    return _buildDateTile(dateTime);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12);
                  },
                  itemCount: 7);
            })),
        SizedBox(height: 24),
        CommonDivider(),
        SizedBox(height: 18),
        BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          return FutureBuilder<List<TimeSlot>>(
              future: _timeSlotFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final timeSlots = snapshot.data!;

                  if (timeSlots.isEmpty) {
                    return Column(children: [
                      SizedBox(height: 60),
                      NoItemFoundContainer(
                          imageSize: 100,
                          title: 'No Timeslots available for the date')
                    ]);
                  }

                  timeSlots.sort((a, b) {
                    final aDateTime = a.startingTime.toDateTime;
                    final bDateTime = b.startingTime.toDateTime;

                    final aTime = TimeOfDay(
                        hour: aDateTime!.hour, minute: aDateTime.minute);
                    final bTime = TimeOfDay(
                        hour: bDateTime!.hour, minute: bDateTime.minute);

                    return aTime.compareTo(bTime);
                  });

                  return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: timeSlots.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 8,
                          childAspectRatio: 4,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final timeSlot = timeSlots[index];

                        final fromDateTime = timeSlot.startingTime.toDateTime;
                        final toDateTime = timeSlot.endingTime.toDateTime;

                        final isSelected =
                            state.cart.timeSlot?.id == timeSlot.id;

                        return InkWell(
                            onTap: () {
                              BlocProvider.of<CartCubit>(context)
                                  .updateTimeSlot(timeSlot);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: isSelected
                                        ? AppColors.primaryPink
                                        : Colors.white,
                                    border: Border.all(
                                        color: AppColors.lightGrey,
                                        width: 0.7)),
                                child: Text(
                                    '${DateFormat().add_jm().format(fromDateTime!.toLocal())} - ${DateFormat().add_jm().format(toDateTime!.toLocal())}',
                                    style: _textTheme.bodySmall!.copyWith(
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.lightText))));
                      });
                }

                return CommonListviewShimmer();
              });
        }),
      ])),
      SizedBox(height: 16),
      BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        return ElevatedButton(
            onPressed:
                state.cart.collectionDate == null || state.cart.timeSlot == null
                    ? null
                    : widget.onContinue,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue),
            child: Text('Continue'));
      }),
      SizedBox(height: 16)
    ]);
  }

  Widget _buildDateTile(DateTime dateTime) {
    final isSelected = dateTime.isEqualDayTo(
        BlocProvider.of<CartCubit>(context).state.cart.collectionDate);

    return InkWell(
        onTap: () {
          BlocProvider.of<CartCubit>(context).updateCollectionDate(dateTime);
          BlocProvider.of<CartCubit>(context).updateTimeSlot(null);
          _initializeTimeSlotFuture();
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

  void _initializeTimeSlotFuture() {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    _timeSlotFuture = OrderService.getValidTimeslots(
        date: cartCubit.state.cart.collectionDate!);
    setState(() {});
  }
}
