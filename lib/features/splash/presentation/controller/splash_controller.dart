import 'package:get/get.dart';
import '/config/all_imports.dart';

class SplashController extends GetxController {
  final SharedPreferencesController _sharedPref = SharedPreferencesController();

  static SplashController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: Constants.durationSplashScreen),
      () {
        if (_sharedPref.getOnBoarding) {
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Get.offAllNamed(Routes.onBoardingScreen);
        }
      },
    );
  }
}
