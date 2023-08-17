import 'package:get/get.dart';
import '/config/all_imports.dart';

class MyScaffoldApp extends StatelessWidget {
  const MyScaffoldApp({
    this.isHomeScreen = false,
    this.isAllNotesScreen = false,
    this.isFavouritesScreen = false,
    this.isTrashScreen = false,
    this.isHiddenScreen = false,
    required this.widget,
    super.key,
  });

  final bool isHomeScreen;
  final bool isAllNotesScreen;
  final bool isFavouritesScreen;
  final bool isTrashScreen;
  final bool isHiddenScreen;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButton: MyFloatingActionButton(
            onPressed: () async => await Get.toNamed(Routes.addNoteScreen),
            icon: Icons.add,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w22,
                end: ManagerWidth.w22,
                top: ManagerHeight.h10,
              ),
              child: Column(
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
                    hintTextStyle: Theme.of(context).textTheme.labelSmall,
                    onChanged: (value) {
                      controller.searchNote(value);
                    },
                    hintText: ManagerStrings.search,
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
                        isHomeScreen: isHomeScreen,
                        route: Routes.allNotesScreen,
                        image: ManagerAssets.noteIcon,
                        isClick: isAllNotesScreen,
                        color: ManagerColors.greyColorIcon,
                        text: ManagerStrings.allNotes,
                      ),
                      SizedBox(width: ManagerWidth.w10),
                      CategoryButton(
                        isHomeScreen: isHomeScreen,
                        route: Routes.favouriteNotesScreen,
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
                        isHomeScreen: isHomeScreen,
                        route: Routes.hiddenNotesScreen,
                        isClick: isHiddenScreen,
                        image: ManagerAssets.hiddenIcon,
                        color: ManagerColors.blueColor,
                        text: ManagerStrings.hidden,
                      ),
                      SizedBox(width: ManagerWidth.w10),
                      CategoryButton(
                        isHomeScreen: isHomeScreen,
                        route: Routes.trashNotesScreen,
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
                  widget,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
