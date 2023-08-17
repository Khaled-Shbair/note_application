import '/config/all_imports.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    //this for disabled button color
    disabledColor: ManagerColors.disabledColorLight,
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorLight,
    textTheme: ManagerTextThemeLight(),
    appBarTheme: AppBarTheme(
      backgroundColor: ManagerColors.appBarBackgroundColorLight,
      centerTitle: true,
      titleTextStyle: mediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontSize.s18,
      ),
    ),
  );
}
