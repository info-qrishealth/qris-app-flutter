import 'package:get/get.dart';

extension StringExtension on String? {
  String? get formattedEnumName => this?.replaceAll('_', ' ').capitalizeFirst;

  bool get isNumeric {
    final RegExp regExp = RegExp(r'^[0-9]+$');
    return regExp.hasMatch(this ?? '');
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
