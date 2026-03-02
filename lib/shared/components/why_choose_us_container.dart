import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_constants.dart';
import '../../modules/health_score_module/components/heath_score_info_tile.dart';
import '../../styles/app_colors.dart';

class WhyChooseUsContainer extends StatelessWidget {
  const WhyChooseUsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBlue, width: 0.7),
            borderRadius: BorderRadius.circular(15)),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.05),
                  border: Border(
                      bottom:
                          BorderSide(color: AppColors.primaryBlue, width: 0.7)),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14))),
              child: Text('Why Choose Us?',
                  style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryBlue,
                      fontFamily: AppConstants.latoFontFamily))),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                SizedBox(height: 4),
                _buildListTile(
                    title: 'NABL Approved Lab',
                    imagePath:
                        'assets/images/icons/why_choose_us_icons/nabl_icon.png'),
                SizedBox(height: 14),
                _buildListTile(
                    title: 'Most Afforadable Price',
                    imagePath:
                        'assets/images/icons/why_choose_us_icons/affordable_icon.png'),
                SizedBox(height: 14),
                _buildListTile(
                    title: 'Cutting-Edge Technologies',
                    imagePath:
                        'assets/images/icons/why_choose_us_icons/cutting_edge_technology_icon.png'),
                SizedBox(height: 14),
                _buildListTile(
                    title: 'New Age Reporting',
                    imagePath:
                        'assets/images/icons/why_choose_us_icons/new_age_icon.png'),
                SizedBox(height: 14),
                _buildListTile(
                    title: 'Expert Team Of Doctors',
                    imagePath:
                        'assets/images/icons/why_choose_us_icons/expert_team_doctor_icon.png'),
                SizedBox(height: 14),
                _buildListTile(
                    title: 'Uncompromising Quality',
                    imagePath:
                        'assets/images/icons/why_choose_us_icons/quality_icon.png'),
              ])),
          SizedBox(height: 4),
        ]));
  }

  Widget _buildListTile({required String imagePath, required String title}) {
    return HealthScoreInfoTile(
        imagePath: imagePath,
        title: title,
        description: null,
        titleStyle: Get.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w600, color: AppColors.primaryBlue),
        imagePadding: 0,
        imageSize: 26);
  }
}
