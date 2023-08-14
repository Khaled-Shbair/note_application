import 'package:get/get.dart';

import 'config/dependency_injection.dart';
import 'core/service/theme_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'config/constants.dart';
import 'routes/route_generator.dart';
import 'routes/routes.dart';

void main() async {
  await initModule();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) : _themeService = ThemeService();

  final ThemeService _themeService;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(Constants.designSizeWidth, Constants.designSizeHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashScreen,
          theme: _themeService.getThemeData(),
          themeMode: _themeService.getThemeMode(),
        );
      },
    );
  }
}
