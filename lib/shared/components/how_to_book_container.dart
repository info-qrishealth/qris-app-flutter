import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../modules/health_score_module/components/heath_score_info_tile.dart';
import '../../styles/app_colors.dart';

class HowToBookContainer extends StatelessWidget {
  const HowToBookContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return DottedBorder(
        color: AppColors.primaryPink.withOpacity(0.7),
        borderType: BorderType.RRect,
        radius: Radius.circular(14),
        borderPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.primaryPink,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14))),
              child: Text('How to book?',
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
                        'assets/images/icons/how_to_book_icons/how_to_book_icon_1.png',
                    title: 'Leave Your name & phone Number With Us'),
                SizedBox(height: 16),
                _buildListTile(
                    imagePath:
                        'assets/images/icons/how_to_book_icons/how_to_book_icon_2.png',
                    title:
                        'We will reach out to you to understand your requirements'),
                SizedBox(height: 16),
                _buildListTile(
                    imagePath:
                        'assets/images/icons/how_to_book_icons/how_to_book_icon_3.png',
                    title:
                        'Lab details & charges will be shared with you over the call'),
                SizedBox(height: 16),
                _buildListTile(
                    imagePath:
                        'assets/images/icons/how_to_book_icons/how_to_book_icon_4.png',
                    title:
                        "We'll book your test as per your preferred date and time slot"),
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
            fontWeight: FontWeight.w500, color: AppColors.lightSubTextColor),
        imagePadding: 0,
        imageSize: 40);
  }
}
