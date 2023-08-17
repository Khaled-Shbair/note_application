import 'package:get/get.dart';
import '/config/all_imports.dart';
class OnBoardingController extends GetxController {
  final SharedPreferencesController _sharedPreferences =
      SharedPreferencesController();

  static OnBoardingController get to => Get.find();
  int currentPage = 0;

  String title = ManagerStrings.titleOnBoardingOne;
  String subTitle = ManagerStrings.subTitleOnBoardingOne;
  String image = ManagerAssets.imageOnBoardingOne;

  void nextButton() {
    if (currentPage == 0) {
      currentPage = 1;
      title = ManagerStrings.titleOnBoardingTwo;
      subTitle = ManagerStrings.subTitleOnBoardingTwo;
      image = ManagerAssets.imageOnBoardingTwo;
    } else if (currentPage == 1) {
      currentPage = 2;
      title = ManagerStrings.titleOnBoardingThree;
      subTitle = ManagerStrings.subTitleOnBoardingThree;
      image = ManagerAssets.imageOnBoardingThree;
    }
    update();
  }

  void skipButton() {
    currentPage = 2;
    title = ManagerStrings.titleOnBoardingThree;
    subTitle = ManagerStrings.subTitleOnBoardingThree;
    image = ManagerAssets.imageOnBoardingThree;
    update();
  }

  void backButton() {
    if (currentPage == 2) {
      currentPage = 1;
      title = ManagerStrings.titleOnBoardingTwo;
      subTitle = ManagerStrings.subTitleOnBoardingTwo;
      image = ManagerAssets.imageOnBoardingTwo;
    } else if (currentPage == 1) {
      currentPage = 0;
      title = ManagerStrings.titleOnBoardingOne;
      subTitle = ManagerStrings.subTitleOnBoardingOne;
      image = ManagerAssets.imageOnBoardingOne;
    }
    update();
  }

  void getStartedButton() async {
    await _sharedPreferences.setOnBoarding();
    await Get.offAllNamed(Routes.homeScreen);
  }

  bool isFirstPage() => currentPage == 0;

  bool isSecondPage() => isFirstPage() == false && isLastPage() == false;

  bool isLastPage() => currentPage == 2;
}
