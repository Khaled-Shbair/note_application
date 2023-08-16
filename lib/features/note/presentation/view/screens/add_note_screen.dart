import 'dart:io';

import 'package:note_application/core/resources/manager_colors.dart';

import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_strings.dart';
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
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: IconButton(
              onPressed: controller.backToHomeScreen,
              icon: const Icon(
                Icons.clear,
                color: ManagerColors.primaryColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async => await controller.createNote(),
                icon: const Icon(Icons.check),
              ),
              IconButton(
                onPressed: controller.image,
                icon: const Icon(Icons.camera_alt),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: MyTextField(
                  controller: controller.titleController,
                  hintText: ManagerStrings.title,
                  fontSizeTextInput: ManagerFontSize.s18,
                  maxLines: Constants.maxLinesInContentNoteFiled,
                  start: ManagerWidth.w24,
                  end: ManagerWidth.w24,
                  isTitle: true,
                ),
              ),
              Expanded(
                flex: 15,
                child: MyTextField(
                  controller: controller.contentController,
                  hintText: ManagerStrings.description,
                  fontSizeTextInput: ManagerFontSize.s18,
                  maxLines: Constants.maxLinesInContentNoteFiled,
                  start: ManagerWidth.w24,
                  end: ManagerWidth.w24,
                ),
              ),
              if(controller.saveImage!=null)...{
                ClipRRect(
                  borderRadius: BorderRadius.circular(ManagerRadius.r16),
                  child: Image.file(
                    File(controller.saveImage!.path),
                    fit: BoxFit.cover,
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
