import '/config/all_imports.dart';

class ContainerShapeOfNoData extends StatelessWidget {
  const ContainerShapeOfNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ManagerHeight.h398,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning_amber,
            size: ManagerIconSize.s80,
            color: ManagerColors.primaryColor,
          ),
          Text(
            ManagerStrings.noData,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
