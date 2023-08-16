import 'package:flutter/material.dart';

import '../../../../../core/widgets/my_scaffold_app.dart';

class FavouriteNotesScreen extends StatelessWidget {
  const FavouriteNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffoldApp(
      isFavouritesScreen: true,
    );
  }
}
