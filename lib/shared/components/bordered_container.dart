import 'package:flutter/material.dart';
import 'package:qris_health/styles/app_colors.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  const BorderedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
