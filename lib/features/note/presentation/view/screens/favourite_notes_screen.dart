import 'package:get/get.dart';

import '/config/all_imports.dart';

class FavouriteNotesScreen extends StatelessWidget {
  const FavouriteNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        controller.favouriteNote();
        return MyScaffoldApp(
          isFavouritesScreen: true,
          widget: ViewListNotes(
            loading: controller.loading,
            notes: controller.favouritesNotes,
            color: ManagerColors.yellowColor_30,
            onTap: () {},
          ),
        );
      },
    );
  }
}
