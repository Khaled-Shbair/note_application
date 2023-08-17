import '/config/all_imports.dart';

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
