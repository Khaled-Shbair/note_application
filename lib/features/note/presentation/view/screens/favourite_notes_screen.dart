import '/config/all_imports.dart';

class FavouriteNotesScreen extends StatelessWidget {
  const FavouriteNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffoldApp(
      isFavouritesScreen: true,
    );
  }
}
