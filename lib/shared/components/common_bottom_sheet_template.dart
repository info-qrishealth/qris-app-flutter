import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';

import 'ios_handle.dart';

class CommonBottomSheetTemplate extends StatelessWidget {
  final Widget child;
  const CommonBottomSheetTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: AppConstants.scaffoldPadding,
            right: AppConstants.scaffoldPadding,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              const SizedBox(height: 12),
              const IosHandle(),
              Expanded(child: child)
            ])));
  }
}
