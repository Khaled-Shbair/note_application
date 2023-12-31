import '/config/all_imports.dart';

TextStyle _textStyle({
  required Color color,
  FontWeight? fontWeight,
  required String fontFamily,
  required double fontSize,
  TextDecoration? decoration,
  double? letterSpacing,
  TextOverflow? overflow,
}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontSize: fontSize,
    color: color,
    decoration: decoration,
    letterSpacing: letterSpacing.onNull(),
    overflow: overflow,
  );
}

TextStyle lightTextStyle({
  required Color color,
  required double fontSize,
  TextDecoration? decoration,
  TextOverflow? overflow,
}) {
  return _textStyle(
    color: color,
    fontFamily: ManagerFontFamily.nunitoSans,
    fontSize: fontSize,
    decoration: decoration.onNull(),
    overflow: overflow,
  );
}

TextStyle regularTextStyle({
  required Color color,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return _textStyle(
    color: color,
    fontFamily: ManagerFontFamily.nunitoSans,
    fontWeight: ManagerFontWeight.w400,
    fontSize: fontSize,
    decoration: decoration.onNull(),
  );
}

TextStyle mediumTextStyle({
  required Color color,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return _textStyle(
    color: color,
    fontFamily: ManagerFontFamily.nunitoSans,
    fontSize: fontSize,
    decoration: decoration.onNull(),
  );
}

TextStyle semiBoldTextStyle({
  required Color color,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.w600,
    color: color,
    fontFamily: ManagerFontFamily.nunitoSans,
    fontSize: fontSize,
    decoration: decoration.onNull(),
  );
}

TextStyle boldTextStyle({
  required Color color,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.w700,
    color: color,
    fontFamily: ManagerFontFamily.nunitoSans,
    fontSize: fontSize,
    decoration: decoration.onNull(),
  );
}
