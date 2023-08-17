import 'package:flutter/material.dart';
import 'manager_colors.dart';
import 'manager_styles.dart';
import 'manager_fonts.dart';

class ManagerTextThemeLight extends TextTheme {
  // @override
  // TextStyle? get labelSmall => regularTextStyle(
  //   color: ManagerColors.textColor.withOpacity(0.60),
  //   fontSize: ManagerFontSize.s18,
  // );

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

  // Container Shape Of Note
  @override
  TextStyle? get bodySmall => lightTextStyle(
        color: ManagerColors.c13,
        fontSize: ManagerFontSize.s12,
      );

  @override
  TextStyle? get bodyMedium => lightTextStyle(
        color: ManagerColors.textColor,
        fontSize: ManagerFontSize.s12,
        overflow: TextOverflow.ellipsis,
      );

  @override
  TextStyle? get bodyLarge => lightTextStyle(
        color: ManagerColors.textColor,
        fontSize: ManagerFontSize.s16,
      );

  // TextField
  @override
  TextStyle? get headlineLarge => boldTextStyle(
        color: ManagerColors.textColor,
        fontSize: ManagerFontSize.s26,
      );

  @override
  TextStyle? get headlineMedium => boldTextStyle(
        color: ManagerColors.greyLightColor,
        fontSize: ManagerFontSize.s26,
      );

  @override
  TextStyle? get headlineSmall => semiBoldTextStyle(
        color: ManagerColors.greyLightColor,
        fontSize: ManagerFontSize.s22,
      );

  @override
  TextStyle? get labelSmall => regularTextStyle(
        color: ManagerColors.textColor,
        fontSize: ManagerFontSize.s20,
      );
}
