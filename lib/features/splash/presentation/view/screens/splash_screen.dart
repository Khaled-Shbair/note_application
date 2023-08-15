import '../../../../../core/resources/manager_colors.dart';
import '../../controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return const Scaffold(
          backgroundColor: ManagerColors.white,
          resizeToAvoidBottomInset: true,
          body: Center(),
        );
      },
    );
  }
}
