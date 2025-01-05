import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

class NavigationRow extends StatelessWidget {
  final Function()? onPreviousTap;
  final Function()? onNextTap;
  final Color? activeColor;
  const NavigationRow(
      {super.key,
      required this.onPreviousTap,
      required this.onNextTap,
      this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
          onTap: onPreviousTap,
          child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onPreviousTap == null
                      ? AppColors.primaryBlue.withOpacity(0.5)
                      : activeColor ?? AppColors.primaryPink),
              child: Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 12))),
      SizedBox(width: 8),
      GestureDetector(
          onTap: onNextTap,
          child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onNextTap == null
                      ? AppColors.primaryBlue.withOpacity(0.5)
                      : activeColor ?? AppColors.primaryPink),
              child: Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 12))),
    ]);
  }
}
