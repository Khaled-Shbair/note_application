import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(Constants.designSizeWidth, Constants.designSizeHeight),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
        );
      }
    );
  }
}
