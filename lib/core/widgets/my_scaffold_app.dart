import 'package:get/get.dart';
import '/config/all_imports.dart';

class MyScaffoldApp extends StatelessWidget {
  const MyScaffoldApp({
    this.isHomeScreen = false,
    this.isAllNotesScreen = false,
    this.isFavouritesScreen = false,
    this.isTrashScreen = false,
    this.isHiddenScreen = false,
    super.key,
  });

  final bool isHomeScreen;
  final bool isAllNotesScreen;
  final bool isFavouritesScreen;
  final bool isTrashScreen;
  final bool isHiddenScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () async => await Get.toNamed(Routes.addNoteScreen),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w22,
            end: ManagerWidth.w22,
            top: ManagerHeight.h10,
          ),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      isHomeScreen && controller.currentDate.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.currentDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: ManagerColors.textGreyColor),
                                ),
                                Text(
                                  ManagerStrings.notes,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: ManagerFontSize.s26,
                                          height: 1.2),
                                ),
                              ],
                            )
                          : IconButton(
                              padding: EdgeInsetsDirectional.zero,
                              highlightColor: ManagerColors.transparent,
                              alignment: AlignmentDirectional.centerStart,
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: ManagerColors.primaryColor,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(height: ManagerHeight.h10),
                  MyTextField(
                    controller: controller.searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      controller.searchNote(value);
                    },
                    hintText: ManagerStrings.search,
                    fontSizeTextInput: ManagerFontSize.s14,
                    filled: true,
                    fillColor: ManagerColors.white,
                    top: ManagerHeight.h10,
                    bottom: ManagerHeight.h10,
                    start: ManagerWidth.w20,
                  ),
                  SizedBox(height: ManagerHeight.h20),
                  Row(
                    children: [
                      CategoryButton(
                        onPressed: () async {
                          isHomeScreen
                              ? await Get.toNamed(Routes.allNotesScreen)
                              : await Get.offNamed(Routes.allNotesScreen);
                        },
                        image: ManagerAssets.noteIcon,
                        isClick: isAllNotesScreen,
                        color: ManagerColors.greyColorIcon,
                        text: ManagerStrings.allNotes,
                      ),
                      SizedBox(width: ManagerWidth.w10),
                      CategoryButton(
                        onPressed: () async {
                          isHomeScreen
                              ? await Get.toNamed(Routes.favouriteNotesScreen)
                              : await Get.offNamed(Routes.favouriteNotesScreen);
                        },
                        isClick: isFavouritesScreen,
                        image: ManagerAssets.favouriteIcon,
                        color: ManagerColors.yellowColor,
                        text: ManagerStrings.favourites,
                      ),
                    ],
                  ),
                  SizedBox(height: ManagerHeight.h10),
                  Row(
                    children: [
                      CategoryButton(
                        onPressed: () async {
                          isHomeScreen
                              ? await Get.toNamed(Routes.hiddenNotesScreen)
                              : await Get.offNamed(Routes.hiddenNotesScreen);
                        },
                        isClick: isHiddenScreen,
                        image: ManagerAssets.hiddenIcon,
                        color: ManagerColors.blueColor,
                        text: ManagerStrings.hidden,
                      ),
                      SizedBox(width: ManagerWidth.w10),
                      CategoryButton(
                        onPressed: () async {
                          isHomeScreen
                              ? await Get.toNamed(Routes.trashNotesScreen)
                              : await Get.offNamed(Routes.trashNotesScreen);
                        },
                        isClick: isTrashScreen,
                        icon: Icons.delete,
                        color: ManagerColors.redColor,
                        text: ManagerStrings.trash,
                      ),
                    ],
                  ),
                  SizedBox(height: ManagerHeight.h20),
                  Text(
                    ManagerStrings.recentNotes,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  if (controller.loading == true) ...{
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  } else ...{
                    Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: ManagerWidth.w10,
                          mainAxisSpacing: ManagerHeight.h10,
                          childAspectRatio:
                              ManagerWidth.w220 / ManagerHeight.h250,
                        ),
                        itemCount: controller.searchNotes.length,
                        itemBuilder: (context, index) {
                          var data = controller.searchNotes[index];
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  const Divider(
                                    color: ManagerColors.greyColor,
                                    thickness: Constants
                                        .thicknessOfDividerInMyScaffoldApp,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                        data.content,
                                        textAlign: TextAlign.start,
                                        maxLines: data.maxLinesOfContentNote,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ),
                                  imageNote(controller.imageNote(data.image)),
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
                    ),
                  },
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget imageNote(String? image) {
    if (image != null) {
      return Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h2,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r16,
          ),
          child: Image.file(
            File(image),
            height: ManagerHeight.h80,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
