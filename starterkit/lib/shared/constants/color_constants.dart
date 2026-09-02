import 'package:flutter/material.dart';

/// https://uicolors.app/generate/6750a4
class ColorConstants {
  static const background = Colors.white;

  static const _primary = 0xFF6750a4;
  static const primary = MaterialColor(_primary, {
    50: Color(0xFFf1f1fc),
    100: Color(0xFFe6e7f9),
    200: Color(0xFFd2d2f3),
    300: Color(0xFFb8b7ea),
    400: Color(0xFFa199e0),
    500: Color(0xFF8f80d4),
    600: Color(0xFF7e66c5),
    700: Color(_primary),
    800: Color(0xFF59478c),
    900: Color(0xFF4a3f70),
  });
}

class CustomColors extends ThemeExtension<CustomColors> {
  final Color background;
  final MaterialColor primary;

  const CustomColors({required this.background, required this.primary});

  @override
  CustomColors copyWith({Color? background, MaterialColor? primary}) {
    return CustomColors(
      background: background ?? this.background,
      primary: primary ?? this.primary,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      background: Color.lerp(background, other.background, t) ?? background,
      primary: primary,
    );
  }
}
