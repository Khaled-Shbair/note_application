import '../core/storage/database/database_provider.dart';
import '../core/storage/local/shared_preferences/shared_preferences_controller.dart';
import '../features/note/presentation/controller/home_controller.dart';
import '../features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/splash/presentation/controller/splash_controller.dart';

Future<void> initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController.initSharedPreferences();
  await DatabaseProvider.initDatabase();
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOnBoarding() {
  disposeSplash();
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}

initHome() {
  disposeSplash();
  disposeOnBoarding();
  Get.put<HomeController>(HomeController());
}

disposeHome() {
  Get.delete<HomeController>();
}
