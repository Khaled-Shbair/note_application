import '../../features/note/presentation/view/widgets/category_button.dart';
import '../../features/note/presentation/view/widgets/my_text_field.dart';
import '../../features/note/presentation/model/note_model.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes.dart';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';
import 'package:get/get.dart';

class MyScaffoldApp extends StatelessWidget {
  const MyScaffoldApp({
    required this.controller,
    required this.list,
    this.onChanged,
    this.currentDate,
    this.isHomeScreen = false,
    this.isAllNotesScreen = false,
    this.isFavouritesScreen = false,
    this.isTrashScreen = false,
    this.isHiddenScreen = false,
    this.loading = false,
    super.key,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool isHomeScreen;
  final bool isAllNotesScreen;
  final bool isFavouritesScreen;
  final bool isTrashScreen;
  final bool isHiddenScreen;
  final bool loading;
  final String? currentDate;
  final List<NoteModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isHomeScreen && currentDate != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentDate!,
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
                  controller: controller,
                  keyboardType: TextInputType.text,
                  onChanged: onChanged,
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
                if (loading == true) ...{
                  const Center(child: CircularProgressIndicator()),
                } else ...{
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: ManagerWidth.w10,
                        mainAxisSpacing: ManagerHeight.h10,
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.editNoteScreen,
                              arguments: [
                                list[index].id,
                                list[index].content,
                              ],
                            );
                          },
                          child: Container(
                            padding: EdgeInsetsDirectional.only(
                              start: ManagerWidth.w6,
                              end: ManagerWidth.w6,
                              bottom: ManagerHeight.h6,
                              top: ManagerHeight.h6,
                            ),
                            decoration: BoxDecoration(
                              color: ManagerColors.white,
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r10),
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: ManagerHeight.h70,
                                  child: Text(
                                    list[index].content,
                                    style: TextStyle(
                                      fontSize: ManagerFontSize.s12,
                                      color: ManagerColors.black,
                                      fontWeight: ManagerFontWeight.w400,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [],
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Text(
                                    list[index].date,
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
            ),
          ),
        ),
      ),
    );
  }
}
