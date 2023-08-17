import '/config/all_imports.dart';

class HiddenNotesScreen extends StatelessWidget {
  const HiddenNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffoldApp(
      isHiddenScreen: true,
    );
  }
}
