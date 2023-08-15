import 'dart:io';

import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../controller/home_controller.dart';
import '../../../../../config/constants.dart';
import '../widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: controller.backToHomeScreen,
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: controller.createNote,
                icon: const Icon(Icons.save),
              ),
              IconButton(
                onPressed: () => controller.imageController.image(null),
                icon: const Icon(Icons.camera_alt),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: MyTextField(
                  controller: controller.contentController,
                  hintText: 'sub_title'.tr,
                  fontSizeTextInput: ManagerFontSize.s18,
                  maxLines: Constants.maxLinesInContentNoteFiled,
                  start: ManagerWidth.w24,
                  end: ManagerWidth.w24,
                ),
              ),
              if (controller.imageController.newImagesNote.isNotEmpty) ...{
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w8,
                      end: ManagerWidth.w8,
                      bottom: ManagerHeight.h8,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: ManagerWidth.w8,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.imageController.newImagesNote.length,
                    itemBuilder: (context, index) {
                      File file = File(controller
                          .imageController.newImagesNote[index].image);
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(ManagerRadius.r16),
                        child: Image.file(
                          File(file.path),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              },
            ],
          ),
        );
      },
    );
  }
}
