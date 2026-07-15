import 'package:flutter/material.dart';

extension ColorOpacityExtension on Color {
  /// convert opacity (0.0 - 1.0) to alpha (0 - 255)
  static int opacityToAlpha(double opacity) {
    return (opacity.clamp(0.0, 1.0) * 255).round();
  }

  /// create new color form alpha (0 - 255)
  Color withOpacityAlpha(double opacity) {
    return withAlpha(opacityToAlpha(opacity));
  }
}