import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/styles/app_colors.dart';
import '../../utils/hex_color.dart';

part 'app_banner.freezed.dart';
part 'app_banner.g.dart';

@freezed
class AppBanner with _$AppBanner {
  const AppBanner._();

  @JsonSerializable(explicitToJson: true)
  const factory AppBanner({
    required String title,
    required String description,
    required String buttonText,
    required String onTap,
    required String image,
    String? buttonBackgroundColor,
    String? buttonTextColor,
    required String backgroundColor1,
    String? backgroundColor2,
  }) = _AppBanner;

  factory AppBanner.fromJson(Map<String, dynamic> json) =>
      _$AppBannerFromJson(json);

  Color get backgroundColor1Value => HexColor.hexToColor(backgroundColor1);
  Color? get backgroundColor2Value =>
      HexColor.hexToColor(backgroundColor2, fallback: Colors.transparent);
  Color? get buttonBackgroundColorValue =>
      HexColor.hexToColor(buttonBackgroundColor, fallback: Colors.white);
  Color? get buttonTextColorValue =>
      HexColor.hexToColor(buttonTextColor, fallback: AppColors.primaryPink);
}
