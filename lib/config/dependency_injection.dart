import '../core/storage/database/database_provider.dart';
import '../core/storage/local/shared_preferences/shared_preferences_controller.dart';
import '../features/note/presentation/controller/home_controller.dart';
import '../features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController.initSharedPreferences();
  await DatabaseProvider.initDatabase();
}

initOnBoarding() {
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}

initHome() {
  disposeOnBoarding();
  Get.put<HomeController>(HomeController());
}

disposeHome() {
  Get.delete<HomeController>();
}
