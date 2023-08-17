import '/config/all_imports.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.hintText,
    required this.controller,
    this.inputTextStyle,
    this.hintTextStyle,
    this.fillColor,
    this.filled = false,
    this.maxLines,
    this.keyboardType = TextInputType.multiline,
    this.end = 0.0,
    this.start = 0.0,
    this.top = 0.0,
    this.bottom = 0.0,
    this.onChanged,
    super.key,
  });

  final double start;
  final double top;
  final double bottom;
  final double end;

  final bool filled;
  final Color? fillColor;

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextStyle? inputTextStyle;
  final int? maxLines;

  final String hintText;
  final TextStyle? hintTextStyle;

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      cursorColor: ManagerColors.black,
      maxLines: maxLines,
      style: inputTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(
          start: start,
          end: end,
          top: top,
          bottom: bottom,
        ),
        filled: filled,
        fillColor: filled ? fillColor : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: hintTextStyle,
      ),
    );
  }
}
