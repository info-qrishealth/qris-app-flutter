import 'package:flutter/material.dart';

class OutlinedIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final Icon icon;
  final Function() onTap;
  const OutlinedIconButton(
      {super.key,
      this.backgroundColor,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
                border: Border.all(
                    width: 0.7,
                    color: backgroundColor ?? Colors.black.withOpacity(0.09))),
            child: icon));
  }
}
