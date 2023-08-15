import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/my_scaffold_app.dart';
import '../../controller/home_controller.dart';

class FavouriteNotesScreen extends StatelessWidget {
  const FavouriteNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return MyScaffoldApp(
          controller: controller.searchController,
          isFavouritesScreen: true,
          onChanged: (value) => controller.searchNote(value),
          list: controller.searchNotes,
          currentDate: controller.currentDate,
          loading: controller.loading,
        );
      },
    );
  }
}
