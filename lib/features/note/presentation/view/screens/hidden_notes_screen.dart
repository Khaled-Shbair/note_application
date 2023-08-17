import 'package:get/get.dart';

import '/config/all_imports.dart';

class HiddenNotesScreen extends StatelessWidget {
  const HiddenNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return MyScaffoldApp(
          isHiddenScreen: true,
          widget: ViewListNotes(
            loading: controller.loading,
            notes: controller.hiddenNotes,
          ),
        );
      },
    );
  }
}
