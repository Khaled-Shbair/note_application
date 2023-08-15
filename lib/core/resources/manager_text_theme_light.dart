import 'package:flutter/material.dart';
import 'manager_colors.dart';
import 'manager_styles.dart';
import 'manager_fonts.dart';

class ManagerTextThemeLight extends TextTheme {
  @override
  TextStyle? get displaySmall => semiBoldTextStyle(
        color: ManagerColors.primaryColor,
        fontSize: ManagerFontSize.s14,
      );

  @override
  TextStyle? get displayMedium => regularTextStyle(
        color: ManagerColors.textColor,
        fontSize: ManagerFontSize.s14,
      );

  @override
  TextStyle? get labelSmall => regularTextStyle(
        color: ManagerColors.textColor.withOpacity(0.60),
        fontSize: ManagerFontSize.s18,
      );


  @override
  TextStyle? get displayLarge => mediumTextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontSize.s12,
      );

  @override
  TextStyle? get titleLarge => boldTextStyle(
        color: ManagerColors.textColor,
        fontSize: ManagerFontSize.s32,
      );


  @override
  TextStyle? get titleSmall => boldTextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontSize.s18,
      );
  @override
  TextStyle? get titleMedium => boldTextStyle(
    color: ManagerColors.black,
    fontSize: ManagerFontSize.s16,
  );
}

