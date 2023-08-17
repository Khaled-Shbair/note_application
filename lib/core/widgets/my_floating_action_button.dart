import '/config/all_imports.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      elevation: Constants.zeroElevation,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
