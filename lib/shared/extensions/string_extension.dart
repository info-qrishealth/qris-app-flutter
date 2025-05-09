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

  DateTime? get toDateTime {
    final intTime = int.tryParse(this!);

    if (intTime == null) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(intTime * 1000).toLocal();
  }

  String get clean {
    String cleanedString = this!
        .replaceAll(RegExp(r'&amp;nbsp;'), '')
        .replaceAll(RegExp(r'&amp;#39;'), "'")
        .replaceAll(RegExp(r'&lt;b&gt;'), ' ')
        .replaceAll(RegExp(r'&lt;p&gt;'), '')
        .replaceAll(RegExp(r'&lt;/p&gt;'), '')
        .replaceAll(RegExp(r'&lt;strong&gt;'), '')
        .replaceAll(RegExp(r'&lt;/strong&gt;'), '')
        .replaceAll(RegExp(r'&lt;ul&gt;'), '')
        .replaceAll(RegExp(r'&lt;li&gt;'), '- ')
        .replaceAll(RegExp(r'&lt;/ul&gt;'), '')
        .replaceAll(RegExp(r'&lt;/li&gt;'), '')
        .replaceAll(RegExp(r'&lt;ol&gt;'), '')
        .replaceAll(RegExp(r'&lt;/ol&gt;'), '')
        .replaceAll(RegExp(r'&amp;amp;'), '&')
        .replaceAll(RegExp(r'&lt;/b&gt;'), '')
        .replaceAll(RegExp(r'&lt;br\s*/?&gt;'), '')
        .replaceAll(RegExp(r'&lt;/?'), '')
        .replaceAll(RegExp(r'&gt;'), '')
        .replaceAll(RegExp(r'&nbsp;'), '')
        .replaceAll(RegExp(r'&amp;'), '')
        .replaceAll(RegExp(r'&#39;'), '')
        .replaceAll(RegExp(r'#39;'), '')
        .replaceAll(RegExp(r'nbsp;'), '')
        .replaceAll(RegExp(r'amp;'), '')
        .replaceAll(RegExp(r'_LOC_'), '')
        .replaceAll(RegExp(r'_PRICE_'), '');

    return cleanedString;
  }

  String get htmlString {
    return this!
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&')
        .replaceAll('in _LOC_', '')
        .replaceAll('_LOC_', '');
  }

  String? get returnNullIfStringIsEmptyOrNull {
    if (this == null || this!.isEmpty) {
      return null;
    }

    return this!;
  }
}
