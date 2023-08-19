import '/config/all_imports.dart';

class ViewListNotes extends StatelessWidget {
  const ViewListNotes({
    required this.notes,
    required this.loading,
    this.color = ManagerColors.white,
    this.onLongPress,
    required this.onTap,
    this.longPress = false,
    super.key,
  });

  final List<NoteModel> notes;
  final bool loading;
  final bool longPress;
  final Color color;
  final Function()? onLongPress;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    if (loading != true && notes.isNotEmpty) {
      return Expanded(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Constants.crossAxisCountOfViewListNotes,
            crossAxisSpacing: ManagerWidth.w10,
            mainAxisSpacing: ManagerHeight.h10,
            childAspectRatio: ManagerWidth.w170 / ManagerHeight.h250,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return ContainerShapeOfNote(
              note: notes[index],
              color: color,
              longPress: longPress,
              onLongPress: onLongPress,
              selectDeleted: onTap,
            );
          },
        ),
      );
    } else if (notes.isEmpty) {
      return const ContainerShapeOfNoData();
    } else {
      return const LoadingIndicator();
    }
  }
}
