import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';

import '../../generated/assets.dart';

extension IncludedPackageExtension on IncludedPackage {
  String get imagePath {
    final title = this.title?.toLowerCase();

    if (title == null || title.isEmpty) {
      return Assets.includedPackagesIconOtherTestIcon;
    }

    if (title.contains('lft')) {
      return Assets.includedPackagesIconLftIcon;
    } else if (title.contains('kft')) {
      return Assets.includedPackagesIconKftIcon;
    } else if (title.contains('other')) {
      return Assets.includedPackagesIconOtherTestIcon;
    } else if (title.contains('cbc')) {
      return Assets.includedPackagesIconCbcIcon;
    } else if (title.contains('hba')) {
      return Assets.includedPackagesIconHba1cIcon;
    } else if (title.contains('iron')) {
      return Assets.includedPackagesIconIronIcon;
    } else if (title.contains('lipid')) {
      return Assets.includedPackagesIconLipidIcon;
    } else if (title.contains('thyroid')) {
      return Assets.includedPackagesIconThyroidIcon;
    } else if (title.contains('urine')) {
      return Assets.includedPackagesIconUrineTestIcon;
    } else if (title.contains('glucose')) {
      return Assets.includedPackagesIconBloodGlucoseIcon;
    } else if (title.contains('b12')) {
      return Assets.includedPackagesIconVitaminB12Icon;
    } else if (title.contains('vitamin')) {
      return Assets.includedPackagesIconVitaminDIcon;
    } else {
      return Assets.includedPackagesIconOtherTestIcon;
    }
  }
}
