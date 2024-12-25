import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700));
  }
}
