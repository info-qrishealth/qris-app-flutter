import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  const CommonDivider({super.key, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: color ?? Colors.black.withOpacity(0.09),
        thickness: 1,
        height: height);
  }
}
