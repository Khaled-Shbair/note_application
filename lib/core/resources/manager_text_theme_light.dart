import 'package:flutter/material.dart';
import 'manager_colors.dart';
import 'manager_styles.dart';
import 'manager_fonts.dart';

class ManagerTextThemeLight extends TextTheme {
  @override
  TextStyle? get displayMedium => mediumTextStyle(
    color: ManagerColors.white,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.s18,
  );

  @override
  TextStyle? get displaySmall => mediumTextStyle(
    color: ManagerColors.white,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.s12,
  );
}
