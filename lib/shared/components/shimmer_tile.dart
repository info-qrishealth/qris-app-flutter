import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16),
        child: Row(children: [
          FadeShimmer(
              width: 48, height: 48, radius: 5, fadeTheme: FadeTheme.light),
          SizedBox(width: 16),
          Expanded(
              child: FadeShimmer(
                  width: 200, height: 20, fadeTheme: FadeTheme.light)),
        ]));
  }
}
