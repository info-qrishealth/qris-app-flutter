import 'package:get/get.dart';

extension StringExtension on String? {
  String? get formattedEnumName => this?.replaceAll('_', ' ').capitalizeFirst;

  bool get isNumeric {
    final RegExp regExp = RegExp(r'^[0-9]+$');
    return regExp.hasMatch(this ?? '');
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String? getEllipticText({required int charactersAfterTrim}) {
    if (this == null) {
      return null;
    }

    if (this!.length <= charactersAfterTrim) {
      return this;
    } else {
      return '${this!.substring(0, charactersAfterTrim)}...';
    }
  }
}
