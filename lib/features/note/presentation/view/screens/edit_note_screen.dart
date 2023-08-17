import 'package:get/get.dart';

import '/config/all_imports.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return GetBuilder<HomeController>(
      builder: (controller) {
        // controller.titleController.text = data[2];
        // controller.contentController.text = data[1];
        // controller.imagesOfNote(data[0]);
        File file = File(data[3]);

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
              ClipRRect(
                borderRadius: BorderRadius.circular(ManagerRadius.r16),
                child: Image.file(
                  File(file.path),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
