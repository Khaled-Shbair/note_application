import 'package:get/get.dart';
import '/config/all_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        controller.recentNote;
        return MyScaffoldApp(
          isHomeScreen: true,
          widget: ViewListNotes(
            loading: controller.loading,
            notes: controller.recentNotes,
            onLongPress: controller.changeLongPress,
            longPress: controller.longPress,
            onTap: () {},
            // onTapCancel: controller.changeLongPress,
          ),
        );
      },
    );
  }
}
