import 'package:flutter/material.dart';

Widget willPopScope(Widget child) {
  return WillPopScope(
    child: child,
    onWillPop: () async => false,
  );
}
