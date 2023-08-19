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
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ShapeOfImageNote(
                image: controller.saveImage!.path,
                height: ManagerHeight.h200,
              ),
              SizedBox(
                height: ManagerHeight.h50,
                child: MyTextField(
                  keyboardType: TextInputType.text,
                  controller: controller.titleController,
                  hintText: ManagerStrings.title,
                  start: ManagerWidth.w24,
                  end: ManagerWidth.w24,
                  inputTextStyle: Theme.of(context).textTheme.headlineLarge,
                  hintTextStyle: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: ManagerHeight.h10),
              MyTextField(
                controller: controller.contentController,
                hintText: ManagerStrings.description,
                maxLines: Constants.maxLinesInContentNoteFiled,
                start: ManagerWidth.w24,
                end: ManagerWidth.w24,
                hintTextStyle: Theme.of(context).textTheme.headlineSmall,
                inputTextStyle: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
