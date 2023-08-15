import '../../../../../core/widgets/my_scaffold_app.dart';
import '../../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return MyScaffoldApp(
          controller: controller.searchController,
          onChanged: (value) => controller.searchNote(value),
          list: controller.searchNotes,
          isHomeScreen: true,
          currentDate: controller.currentDate,
          loading: controller.loading,
        );
      },
    );
  }
}
