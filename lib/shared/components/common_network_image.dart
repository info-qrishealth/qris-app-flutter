import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';

class CommonNetworkImage extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const CommonNetworkImage(
      {super.key, required this.name, this.height, this.fit, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.network('${AppConstants.imageBaseUrl}/$name',
        height: height, fit: fit, width: width);
  }
}
