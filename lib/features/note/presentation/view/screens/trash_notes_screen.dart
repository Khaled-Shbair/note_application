import 'package:get/get.dart';

import '/config/all_imports.dart';

class TrashNotesScreen extends StatelessWidget {
  const TrashNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return MyScaffoldApp(
          isTrashScreen: true,
          widget: ViewListNotes(
            loading: controller.loading,
            notes: controller.trashNotes,
          ),
        );
      },
    );
  }
}
