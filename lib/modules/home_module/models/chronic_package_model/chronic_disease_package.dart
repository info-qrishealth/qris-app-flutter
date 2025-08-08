import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enum/chronic_disease_item_type.dart';

part 'chronic_disease_package.freezed.dart';
part 'chronic_disease_package.g.dart';

@freezed
class ChronicDiseasePackage with _$ChronicDiseasePackage {
  const factory ChronicDiseasePackage(
      {required String title,
      String? idealFor,
      String? why,
      required List<ChronicPackageItem> includes,
      required double originalPrice,
      required double discountedPrice}) = _ChronicDiseasePackage;

  factory ChronicDiseasePackage.fromJson(Map<String, dynamic> json) =>
      _$ChronicDiseasePackageFromJson(json);
}

@freezed
class ChronicPackageItem with _$ChronicPackageItem {
  const factory ChronicPackageItem({
    required ChronicPackageItemType type,
    required String title,
    String? details,
  }) = _ChronicPackageItem;

  factory ChronicPackageItem.fromJson(Map<String, dynamic> json) =>
      _$ChronicPackageItemFromJson(json);
}
