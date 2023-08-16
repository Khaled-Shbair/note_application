import '../../../../../core/widgets/my_scaffold_app.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffoldApp(
      isHomeScreen: true,
    );
  }
}
