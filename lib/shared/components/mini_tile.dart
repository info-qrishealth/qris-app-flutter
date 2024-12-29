import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/health_score_module/components/health_score_list_tile.dart';

class MiniTile extends StatelessWidget {
  final String imagePath;
  final String title;

  const MiniTile({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return HealthScoreListTile(
        imagePath: imagePath,
        title: title,
        imageSize: 24,
        style: Get.textTheme.bodySmall!
            .copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1));
  }
}
