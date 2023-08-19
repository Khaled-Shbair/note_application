import '/config/all_imports.dart';

class ShapeOfImageNote extends StatelessWidget {
  const ShapeOfImageNote({
    required this.image,
    required this.height,
    this.isLarge = false,
    super.key,
  });

  final String image;
  final double height;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    if (image.isNotEmpty && image != '') {
      return Padding(
        padding: EdgeInsetsDirectional.only(
          bottom: isLarge ? ManagerHeight.h16 : ManagerHeight.h0,
          start: isLarge ? ManagerWidth.w10 : ManagerWidth.w0,
          end: isLarge ? ManagerWidth.w10 : ManagerWidth.w0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ManagerRadius.r16),
          child: Image.file(
            File(image),
            height: height,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
