import 'package:flutter/material.dart';

import '../../../../../core/widgets/my_scaffold_app.dart';

class HiddenNotesScreen extends StatelessWidget {
  const HiddenNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffoldApp(
      isHiddenScreen: true,
    );
  }
}
