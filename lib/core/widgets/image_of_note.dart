import '/config/all_imports.dart';

class ImageOfNote extends StatelessWidget {
  const ImageOfNote(this.image, {super.key});

  final String? image;

  @override
  Widget build(BuildContext context) {
    if (image != null && image != '') {
      File file = File(image!);
      return Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h2,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r16,
          ),
          child: Image.file(
            File(file.path),
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
