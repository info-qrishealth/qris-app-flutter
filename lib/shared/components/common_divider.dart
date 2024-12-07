import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

class CommonDivider extends StatelessWidget {
  final Color? color;
  const CommonDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: color ?? Colors.black.withOpacity(0.09), thickness: 1);
  }
}
