import 'package:get/get.dart';
import '/config/all_imports.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButton: MyFloatingActionButton(
            onPressed: controller.openCamera,
            icon: Icons.camera_alt,
          ),
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
                onPressed: controller.changeFavourite,
                icon: Icon(
                  controller.favourites ? Icons.star : Icons.star_border,
                ),
              ),
              IconButton(
                onPressed: () async => await controller.createNote(),
                icon: const Icon(Icons.check),
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
              if (controller.saveImage != null) ...{
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
