import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/shimmer_tile.dart';

class CommonListviewShimmer extends StatelessWidget {
  const CommonListviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
        shrinkWrap: true,
        children: List.generate(8, (index) => ShimmerTile()));
  }
}
