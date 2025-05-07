import 'dart:ui';

import 'package:flutter/material.dart';

class HexColor {
  static Color hexToColor(String? hexString, {Color fallback = Colors.white}) {
    if (hexString == null || hexString.isEmpty) return fallback;

    final cleanedHex = hexString.replaceFirst('#', '');
    if (cleanedHex.length != 6 && cleanedHex.length != 8) return fallback;

    try {
      final buffer = StringBuffer();
      if (cleanedHex.length == 6) buffer.write('ff');
      buffer.write(cleanedHex);
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return fallback;
    }
  }
}
