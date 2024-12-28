import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../modules/health_score_module/components/heath_score_info_tile.dart';
import '../../styles/app_colors.dart';

class HowItWorksContainer extends StatelessWidget {
  const HowItWorksContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return DottedBorder(
        color: AppColors.primaryBlue.withOpacity(0.7),
        borderType: BorderType.RRect,
        radius: Radius.circular(14),
        borderPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14))),
              child: Text('How it works?',
                  style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: AppConstants.latoFontFamily))),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                SizedBox(height: 4),
                _buildListTile(
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/package_book_icon.png',
                    title: 'Book the package',
                    description:
                        'Report your symptoms and history in our questionnaire to our team of Doctor professional for evaluation.'),
                SizedBox(height: 16),
                _buildListTile(
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/doctor_consultation_icon.png',
                    title: 'Doctor Consultation',
                    description:
                        'Our team of professional Doctor will speak to you on call or video.'),
                SizedBox(height: 16),
                _buildListTile(
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/treatment_icon.png',
                    title: 'Ongoing treatment',
                    description:
                        'Send your queries anytime to our professional related to your condition.'),
                SizedBox(height: 16),
                _buildListTile(
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/scooter_medicine_delivery_icon.png',
                    title: 'Medicine Delivery',
                    description:
                        'If prescribed, your medicines  would be sent in a discreet packaging.')
              ])),
          SizedBox(height: 4),
        ]));
  }

  Widget _buildListTile(
      {required String title,
      required String description,
      required String imagePath}) {
    return HealthScoreInfoTile(
        imagePadding: 0,
        titleColor: AppColors.primaryBlue,
        imagePath: imagePath,
        imageSize: 40,
        title: title,
        description: description);
  }
}
