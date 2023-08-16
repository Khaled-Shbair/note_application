import '../../../../core/storage/local/shared_preferences/shared_preferences_controller.dart';
import '../../../../config/constants.dart';
import '../../../../routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: Constants.durationSplashScreen),
      () {
        if (SharedPreferencesController.getOnBoarding) {
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Get.offAllNamed(Routes.onBoardingScreen);
        }
      },
    );
  }
}
