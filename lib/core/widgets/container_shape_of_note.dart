import 'package:get/get.dart';
import '/config/all_imports.dart';

class ContainerShapeOfNote extends StatelessWidget {
  const ContainerShapeOfNote({
    required this.onLongPress,
    required this.longPress,
    required this.note,
    required this.selectDeleted,
    required this.color,
    super.key,
  });

  final Function()? onLongPress;
  final Function()? selectDeleted;
  final NoteModel note;
  final bool longPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: () {
        Get.toNamed(
          Routes.editNoteScreen,
          arguments: [
            note.id,
            note.content,
            note.title,
            note.image,
          ],
        );
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w10,
          end: ManagerWidth.w10,
          bottom: ManagerHeight.h8,
          top: ManagerHeight.h10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(
                Constants.xOffsetOfContainerShapeOfNote,
                Constants.yOffsetOfContainerShapeOfNote,
              ),
              color: ManagerColors.shadowColors,
              blurRadius: Constants.blurRadiusOfContainerShapeOfNote,
              spreadRadius: Constants.spreadRadius,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width:
                      longPress == true ? ManagerWidth.w130 : ManagerWidth.w148,
                  child: Text(
                    note.title,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                longPress == true
                    ? SelectDeleted(
                        checked: note.trash == 1 ? true : false,
                        onTap: selectDeleted,
                      )
                    : const SizedBox(),
              ],
            ),
            const Divider(
              color: ManagerColors.greyColor,
              thickness: Constants.thicknessOfDividerInMyScaffoldApp,
            ),
            Expanded(
              child: SizedBox(
                child: Text(
                  note.content,
                  textAlign: TextAlign.start,
                  maxLines: note.maxLinesOfContentNote,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            ImageOfNote(note.image),
            SizedBox(height: ManagerHeight.h2),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                note.date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
