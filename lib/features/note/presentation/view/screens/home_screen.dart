import 'package:get/get.dart';
import '/config/all_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return MyScaffoldApp(
          isHomeScreen: true,
          widget: ViewListNotes(
            loading: controller.loading,
            notes: controller.searchNotes,
            onLongPress: controller.changeLongPress,
            longPress: controller.longPress,

            // onTapCancel: controller.changeLongPress,
          ),
        );
      },
    );
  }
}
