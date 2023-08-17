import 'package:get/get.dart';
import '/config/all_imports.dart';

class ViewListNotes extends StatelessWidget {
  const ViewListNotes({
    required this.notes,
    required this.loading,
    super.key,
  });

  final List<NoteModel> notes;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading != true && notes.isNotEmpty) {
      return Expanded(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: ManagerWidth.w10,
            mainAxisSpacing: ManagerHeight.h10,
            childAspectRatio: ManagerWidth.w220 / ManagerHeight.h250,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            var data = notes[index];
            return InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.editNoteScreen,
                  arguments: [
                    data.id,
                    data.content,
                    data.title,
                    data.image,
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
                  color: ManagerColors.white,
                  borderRadius: BorderRadius.circular(
                    ManagerRadius.r10,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      color: ManagerColors.shadowColors,
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Divider(
                      color: ManagerColors.greyColor,
                      thickness: Constants.thicknessOfDividerInMyScaffoldApp,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          data.content,
                          textAlign: TextAlign.start,
                          maxLines: data.maxLinesOfContentNote,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    ImageOfNote(data.image),
                    SizedBox(height: ManagerHeight.h4),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(
                        data.date,
                        style: TextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.c13,
                          fontWeight: ManagerFontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else if (notes.isEmpty) {
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
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
