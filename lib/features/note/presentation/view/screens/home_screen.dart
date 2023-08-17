import '/config/all_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffoldApp(
      isHomeScreen: true,
    );
  }
}
