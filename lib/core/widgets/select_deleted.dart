import '/config/all_imports.dart';

class SelectDeleted extends StatelessWidget {
  const SelectDeleted({
    required this.checked,
    // required this.onTap,
    this.onTap,
    super.key,
  });

  final bool checked;

  // final Function() onTap;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ManagerHeight.h18,
        width: ManagerWidth.w18,
        decoration: BoxDecoration(
          color: checked ? ManagerColors.redColor : ManagerColors.black,
          shape: BoxShape.circle,
        ),
        child: checked
            ? const Icon(
                Icons.check,
                color: ManagerColors.white,
                size: ManagerIconSize.s18,
              )
            : const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,
              ),
      ),
    );
  }
}
