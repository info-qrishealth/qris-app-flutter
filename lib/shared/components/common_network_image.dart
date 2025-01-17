import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';

class CommonNetworkImage extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholderPath;
  const CommonNetworkImage(
      {super.key,
      required this.name,
      this.height,
      this.fit,
      this.width,
      this.placeholderPath});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: '${AppConstants.imageBaseUrl}/$name',
        errorWidget: (context, _, _1) {
          return Image.asset(
              fit: fit,
              placeholderPath ?? 'assets/images/logos/full_logo.png',
              height: height,
              width: width);
        },
        placeholder: (context, _) {
          return Image.asset(
              fit: fit,
              placeholderPath ?? 'assets/images/logos/full_logo.png',
              height: height,
              width: width);
        },
        height: height,
        fit: fit,
        width: width);
  }
}
