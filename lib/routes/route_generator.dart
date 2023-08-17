import '/config/all_imports.dart';

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
