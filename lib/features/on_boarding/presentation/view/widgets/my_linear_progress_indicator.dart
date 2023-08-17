import '/config/all_imports.dart';

class MyLinearProgressIndicator extends StatelessWidget {
  const MyLinearProgressIndicator({
    required this.pageOne,
    required this.pageTwo,
    required this.pageThree,
    super.key,
  });

  final bool pageOne;
  final bool pageTwo;
  final bool pageThree;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: Constants.durationOnBoardingScreen),
      child: Container(
        height: ManagerHeight.h6,
        decoration: BoxDecoration(
          color: ManagerColors.greyLightColor,
          borderRadius: BorderRadius.circular(ManagerRadius.r46),
        ),
        child: Row(
          children: [
            Expanded(child: _itemMyLinearProgressIndicator(context, pageOne)),
            Expanded(child: _itemMyLinearProgressIndicator(context, pageTwo)),
            Expanded(child: _itemMyLinearProgressIndicator(context, pageThree)),
          ],
        ),
      ),
    );
  }
}

Widget _itemMyLinearProgressIndicator(context, bool active) {
  return Container(
    height: ManagerHeight.h6,
    decoration: BoxDecoration(
      color: active ? Theme.of(context).primaryColor : ManagerColors.greyColor,
      borderRadius: BorderRadius.circular(ManagerRadius.r46),
    ),
  );
}
