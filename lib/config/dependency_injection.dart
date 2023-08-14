import '../core/storage/local/shared_preferences/shared_preferences_controller.dart';
import '../features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController.initSharedPreferences();
}

initOnBoarding() {
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}
