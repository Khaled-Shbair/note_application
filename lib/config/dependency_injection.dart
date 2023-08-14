import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/on_boarding/presentation/controller/on_boarding_controller.dart';

Future<void> initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
}

initOnBoarding() {
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}
