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
    this.radius,
    super.key,
  });

  final Function()? onPressed;
  final Widget child;
  final double? height;
  final double? width;
  final double? elevation;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed.onNull(),
      height: height.onNull(),
      minWidth: width.onNull(),
      elevation: elevation.onNull(),
      color: color.onNull(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.onNull()),
      ),
      child: child,
    );
  }
}
