import 'package:flutter/material.dart';
import '../../core/resources/manager_fonts.dart';

TextStyle _textStyle({
  required Color color,
  required FontWeight fontWeight,
  required String fontFamily,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontSize: fontSize,
    color: color,
    decoration: decoration,
  );
}

TextStyle regularTextStyle({
  required Color color,
  required String fontFamily,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.w400,
    color: color,
    fontFamily: fontFamily,
    fontSize: fontSize,
    decoration: decoration,
  );
}

TextStyle mediumTextStyle({
  required Color color,
  required String fontFamily,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.w500,
    color: color,
    fontFamily: fontFamily,
    fontSize: fontSize,
    decoration: decoration,
  );
}

TextStyle boldTextStyle({
  required Color color,
  required String fontFamily,
  required double fontSize,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.w700,
    color: color,
    fontFamily: fontFamily,
    fontSize: fontSize,
    decoration: decoration,
  );
}
