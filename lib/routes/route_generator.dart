import '../config/dependency_injection.dart';
import '../core/resources/manager_strings.dart';
import 'package:flutter/material.dart';

import '../features/note/presentation/view/screens/add_note_screen.dart';
import '../features/note/presentation/view/screens/all_notes_screen.dart';
import '../features/note/presentation/view/screens/edit_note_screen.dart';
import '../features/note/presentation/view/screens/favourite_notes_screen.dart';
import '../features/note/presentation/view/screens/hidden_notes_screen.dart';
import '../features/note/presentation/view/screens/home_screen.dart';
import '../features/note/presentation/view/screens/trash_notes_screen.dart';
import '../features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import '../features/splash/presentation/view/screens/splash_screen.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        initOnBoarding();
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.homeScreen:
        initHome();
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.editNoteScreen:
        return MaterialPageRoute(builder: (_) => const EditNoteScreen());
      case Routes.addNoteScreen:
        return MaterialPageRoute(builder: (_) => const AddNoteScreen());
      case Routes.favouriteNotesScreen:
        return MaterialPageRoute(builder: (_) => const FavouriteNotesScreen());
      case Routes.allNotesScreen:
        return MaterialPageRoute(builder: (_) => const AllNotesScreen());
      case Routes.hiddenNotesScreen:
        return MaterialPageRoute(builder: (_) => const HiddenNotesScreen());
      case Routes.trashNotesScreen:
        return MaterialPageRoute(builder: (_) => const TrashNotesScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
