import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_dark.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
    primaryColorDark: ManagerColors.primaryColorDark,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,
    textTheme: ManagerTextThemeDark(),
    appBarTheme: AppBarTheme(
      backgroundColor: ManagerColors.transparent,
      elevation: Constants.elevationAppBar,
      centerTitle: true,
      titleTextStyle: boldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontSize.s18,
      ),
    ),
    // this for disabled button color
    disabledColor: ManagerColors.disabledColorDark,
  );
}
