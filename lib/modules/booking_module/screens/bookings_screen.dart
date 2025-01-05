import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_filled_chip.dart';

import '../components/booking_list_tile.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Bookings/Reports'),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 16),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonFilledChip(isSelected: true, title: 'All'),
                        SizedBox(width: 8),
                        CommonFilledChip(
                            isSelected: false, title: 'Puneet Bajaj'),
                        SizedBox(width: 8),
                        CommonFilledChip(
                            isSelected: false, title: 'Deepika Rathore'),
                      ]))),
          SizedBox(height: 18),
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BookingListTile();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: 10))
        ]));
  }
}
