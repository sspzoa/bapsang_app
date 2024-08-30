import 'package:bapsang_app/app/core/theme/bapsang_colors.dart';
import 'package:bapsang_app/app/core/theme/bapsnag_typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BapsangSnackBar {
  static void open(String title, {Color? borderColor, Color? textColor}) {
    BuildContext context = Get.context!;
    BapsangColors colorTheme = Theme.of(context).extension<BapsangColors>()!;
    BapsangTypography textTheme = Theme.of(context).extension<BapsangTypography>()!;
    Get.rawSnackbar(
      titleText: Center(
        child: Text(
          title,
          style: textTheme.paragraph1.copyWith(color: colorTheme.grayscale900),
          textAlign: TextAlign.center,
        ),
      ),
      messageText: Container(),
      backgroundColor: colorTheme.grayscale100,
      borderColor: borderColor ?? colorTheme.primaryBrand,
      borderRadius: 9999,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      animationDuration: const Duration(milliseconds: 500),
    );
  }
}

class BapsangErrorSnackBar {
  void open(String title, {String? message, bool haptic = true}) {
    BuildContext context = Get.context!;
    BapsangColors colorTheme = Theme.of(context).extension<BapsangColors>()!;
    BapsangSnackBar.open(title, borderColor: colorTheme.primaryNegative);
  }
}
