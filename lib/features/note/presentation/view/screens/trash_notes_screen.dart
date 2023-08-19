import 'package:get/get.dart';
import '/config/all_imports.dart';

class TrashNotesScreen extends StatelessWidget {
  const TrashNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        controller.trashNote();
        return MyScaffoldApp(
          isTrashScreen: true,
          widget: ViewListNotes(
            loading: controller.loading,
            notes: controller.trashNotes,
            color: ManagerColors.redColor_10,
            onTap: () {},
          ),
        );
      },
    );
  }
}
