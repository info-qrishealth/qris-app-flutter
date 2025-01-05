import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_constants.dart';
import '../../styles/app_colors.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(36)),
        child: Row(children: [
          SvgPicture.asset('assets/images/icons/star_icon.svg'),
          SizedBox(width: 4),
          Text('4.9',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontFamily: AppConstants.latoFontFamily,
                  fontWeight: FontWeight.w400))
        ]));
  }
}
