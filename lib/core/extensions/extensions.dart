import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';

extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    }
    return this!;
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0;
    }
    return this!;
  }
}

extension NonNullInt on int? {
  int onNull() {
    if (this == null) {
      return 0;
    }
    return this!;
  }
}

extension NonNullBool on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    }
    return this!;
  }
}

extension NonNullColor on Color? {
  Color onNull() {
    if (this == null) {
      return ManagerColors.transparent;
    }
    return this!;
  }
}

extension NonNullVoidFunction on void Function()? {
  Function() onNull() {
    if (this == null) {
      return () {};
    }
    return this!;
  }
}

extension NonNullBoolFunction on bool Function()? {
  bool Function() onNull() {
    if (this == null) {
      return () => false;
    }
    return this!;
  }
}
