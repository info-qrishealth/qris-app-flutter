import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const HeadingText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style ??
            Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700));
  }
}
