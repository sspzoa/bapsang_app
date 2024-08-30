import 'package:bapsang_app/app/core/theme/dark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final BapsangDarkTheme _darkTheme = BapsangDarkTheme();

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SUITv1',
  colorScheme: ColorScheme.fromSeed(
    seedColor: _darkTheme.colors.primaryBrand,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleSpacing: 0,
    foregroundColor: _darkTheme.colors.grayscale1000,
    centerTitle: false,
  ),
  textSelectionTheme: TextSelectionThemeData(
      selectionColor: _darkTheme.colors.primaryBrand.withAlpha(100),
      selectionHandleColor: _darkTheme.colors.primaryBrand),
  cupertinoOverrideTheme:
      CupertinoThemeData(primaryColor: _darkTheme.colors.primaryBrand),
  scaffoldBackgroundColor: _darkTheme.colors.grayscale100,
  extensions: [_darkTheme.colors, _darkTheme.textStyle],
  cardColor: _darkTheme.colors.grayscale100,
);
