import '../../../../../core/resources/manager_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.hintText,
    required this.controller,
    required this.fontSizeTextInput,
    this.fillColor,
    this.filled = false,
    this.maxLines,
    this.keyboardType = TextInputType.multiline,
    this.end = 0.0,
    this.start = 0.0,
    this.top = 0.0,
    this.bottom = 0.0,
    this.fontSizeHintText,
    this.onChanged,
    this.isTitle = false,
    this.isDescription = false,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;
  final double fontSizeTextInput;
  final double? fontSizeHintText;
  final TextInputType keyboardType;
  final int? maxLines;
  final double start;
  final double top;
  final double bottom;
  final double end;
  final bool filled;
  final bool isTitle;
  final bool isDescription;
  final Color? fillColor;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      cursorColor: ManagerColors.black,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSizeTextInput,
        color: ManagerColors.black,
        fontWeight: ManagerFontWeight.w400,
      ),
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
        hintStyle: isTitle
            ? Theme.of(context).textTheme.headlineMedium
            : isDescription
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
