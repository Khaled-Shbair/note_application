import '/config/all_imports.dart';

Widget willPopScope(Widget child) {
  return WillPopScope(
    child: child,
    onWillPop: () async => false,
  );
}
