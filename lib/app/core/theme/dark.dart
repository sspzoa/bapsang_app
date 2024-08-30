import 'package:flutter/material.dart';

import 'bapsang_colors.dart';
import 'bapsang_theme.dart';
import 'bapsnag_typography.dart';

class BapsangDarkThemeColors extends BapsangColors {
  BapsangDarkThemeColors()
      : super(
          grayscale100: const Color(0xFF222525),
          grayscale200: const Color(0xFF1C1F1F),
          grayscale300: const Color(0xFF2C3030),
          grayscale400: const Color(0xFF3B3F40),
          grayscale500: const Color(0xFF808989),
          grayscale600: const Color(0xFFB4B9B9),
          grayscale700: const Color(0xFFDADDDD),
          grayscale800: const Color(0xFFEAEBEB),
          grayscale900: const Color(0xFFF4F5F5),
          grayscale1000: const Color(0xFFFDFEFE),
          primaryBrand: const Color(0xFF2ED096),
          primaryNegative: const Color(0xFFF7CE45),
        );
}

class BapsangDarkThemeTypography extends BapsangTypography {
  BapsangDarkThemeTypography()
      : super(defaultColor: BapsangDarkThemeColors().grayscale700);
}

class BapsangDarkTheme extends BapsangTheme {
  BapsangDarkTheme()
      : super(
            colors: BapsangDarkThemeColors(),
            textStyle: BapsangDarkThemeTypography());
}
