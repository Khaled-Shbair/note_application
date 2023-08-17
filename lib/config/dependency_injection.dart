import 'package:get/get.dart';
import '../../config/all_imports.dart';

SharedPreferencesController _sharedPref = SharedPreferencesController();

Future<void> initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _sharedPref.initSharedPreferences();
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
