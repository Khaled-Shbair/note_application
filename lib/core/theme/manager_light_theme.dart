import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_light.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    //this for disabled button color
    disabledColor: ManagerColors.disabledColorLight,
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorLight,
    scaffoldBackgroundColor: ManagerColors.white,

    textTheme: ManagerTextThemeLight(),
    appBarTheme: AppBarTheme(
      backgroundColor: ManagerColors.appBarBackgroundColorLight,
      centerTitle: true,
      titleTextStyle: mediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontSize.s18,
        fontFamily: ManagerFontFamily.almarai,
      ),
    ),
  );
}
