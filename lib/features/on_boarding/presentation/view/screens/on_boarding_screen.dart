import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GetBuilder<OnBoardingController>(
          builder: (controller) {
            return const Column(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
