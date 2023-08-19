import 'package:get/get.dart';
import '/config/all_imports.dart';

class AllNotesScreen extends StatelessWidget {
  const AllNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return MyScaffoldApp(
          isAllNotesScreen: true,
          widget: ViewListNotes(
            loading: controller.loading,
            notes: controller.searchNotes,
            color: ManagerColors.greyColor_10,
          ),
        );
      },
    );
  }
}
