import 'package:flutter/material.dart';
import '../../core/extensions/extensions.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.child,
    this.onPressed,
    this.height,
    this.width,
    this.elevation,
    this.color,
    super.key,
  });

  final Function()? onPressed;
  final Widget child;
  final double? height;
  final double? width;
  final double? elevation;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed.onNull(),
      height: height.onNull(),
      minWidth: width.onNull(),
      elevation: elevation.onNull(),
      color: color.onNull(),
      child: child,
    );
  }
}
