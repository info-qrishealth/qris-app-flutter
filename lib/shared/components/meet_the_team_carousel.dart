import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../modules/health_module/components/doctor_carousel_card.dart';
import '../../styles/app_colors.dart';
import 'heading_text.dart';

class MeetTheTeamCarousel extends StatefulWidget {
  const MeetTheTeamCarousel({super.key});

  @override
  State<MeetTheTeamCarousel> createState() => _MeetTheTeamCarouselState();
}

class _MeetTheTeamCarouselState extends State<MeetTheTeamCarousel> {
  final _pageController = FlutterCarouselController();
  int _selectedIndex = 1;

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
                index: index, selectedIndex: _selectedIndex);
          },
          options: FlutterCarouselOptions(
              aspectRatio: 1.25,
              initialPage: 1,
              controller: _pageController,
              enlargeCenterPage: true,
              showIndicator: false,
              enlargeFactor: 0.2,
              viewportFraction: 0.75),
          itemCount: 3),
      SizedBox(height: 12),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildArrowButton(
            icon: Icons.arrow_back_ios_new,
            onTap: _selectedIndex == 0
                ? null
                : () {
                    _pageController.previousPage();
                    _selectedIndex--;
                    setState(() {});
                  }),
        SizedBox(width: 8),
        _buildArrowButton(
            icon: Icons.arrow_forward_ios,
            onTap: _selectedIndex == 2
                ? null
                : () {
                    _pageController.nextPage();
                    _selectedIndex++;
                    setState(() {});
                  }),
      ]),
    ]));
  }

  Widget _buildArrowButton(
      {required IconData icon, required Function()? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: onTap == null
                    ? AppColors.primaryBlue.withOpacity(0.5)
                    : AppColors.primaryPink),
            child: Icon(icon, color: Colors.white, size: 12)));
  }
}
