import '/config/all_imports.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      height: ManagerHeight.h56,
      width: double.infinity,
      radius: ManagerRadius.r14,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
