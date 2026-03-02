import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:qris_health/shared/components/navigation_row.dart';
import 'package:qris_health/shared/models/qris_team_doctor/qris_team_doctor.dart';

import '../../modules/health_module/components/doctor_carousel_card.dart';
import 'heading_text.dart';

class MeetTheTeamCarousel extends StatefulWidget {
  final List<QrisTeamDoctor> doctors;
  const MeetTheTeamCarousel({super.key, required this.doctors});

  @override
  State<MeetTheTeamCarousel> createState() => _MeetTheTeamCarouselState();
}

class _MeetTheTeamCarouselState extends State<MeetTheTeamCarousel> {
  final _pageController = FlutterCarouselController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      HeadingText(text: 'Meet the Team'),
      SizedBox(height: 16),
      FlutterCarousel.builder(
          itemBuilder: (context, index, i) {
            return DoctorCarouselCard(
                index: index,
                selectedIndex: _selectedIndex,
                doctor: widget.doctors[index]);
          },
          options: FlutterCarouselOptions(
              autoPlay: true,
              onPageChanged: (index, _) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              aspectRatio: 1.2,
              initialPage: 0,
              controller: _pageController,
              enlargeCenterPage: true,
              showIndicator: false,
              enlargeFactor: 0.2,
              viewportFraction: 0.76),
          itemCount: widget.doctors.length),
      SizedBox(height: 12),
      if (widget.doctors.length > 1)
        Center(
            child: NavigationRow(
                onPreviousTap: _selectedIndex == 0
                    ? null
                    : () {
                        _pageController.previousPage();
                      },
                onNextTap: _selectedIndex == widget.doctors.length - 1
                    ? null
                    : () {
                        _pageController.nextPage();
                      })),
    ]));
  }
}
