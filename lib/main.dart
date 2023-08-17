import 'package:get/get.dart';

import '/config/all_imports.dart';

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
      designSize:
          const Size(Constants.designSizeWidth, Constants.designSizeHeight),
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
