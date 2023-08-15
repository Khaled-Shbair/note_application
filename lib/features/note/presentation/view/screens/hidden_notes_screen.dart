import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/my_scaffold_app.dart';
import '../../controller/home_controller.dart';

class HiddenNotesScreen extends StatelessWidget {
  const HiddenNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return MyScaffoldApp(
          controller: controller.searchController,
          isHiddenScreen: true,
          onChanged: (value) => controller.searchNote(value),
          list: controller.searchNotes,
          currentDate: controller.currentDate,
          loading: controller.loading,
        );
      },
    );
  }
}
