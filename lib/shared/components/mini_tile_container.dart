import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/shared/components/mini_tile.dart';
import 'package:qris_health/shared/models/title_and_description_model.dart';

import '../../styles/app_colors.dart';

class MiniTileContainer extends StatelessWidget {
  final List<TitleAndDescriptionModel> titles;
  const MiniTileContainer({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        borderType: BorderType.RRect,
        radius: Radius.circular(15),
        color: AppColors.borderColor,
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MiniTile(
                  imagePath: titles[index].imagePath,
                  title: titles[index].title);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 12);
            },
            itemCount: titles.length));
  }
}
