import 'package:get/get.dart';
import '/config/all_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.white,
          resizeToAvoidBottomInset: true,
          body: Center(
            child: SvgPicture.asset(
              ManagerAssets.logo,
              height: ManagerHeight.h170,
            ),
          ),
        );
      },
    );
  }
}
