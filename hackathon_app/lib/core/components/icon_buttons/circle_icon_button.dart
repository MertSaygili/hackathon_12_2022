import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {super.key,
      this.color,
      this.backgroundColor,
      this.iconSize,
      this.radius,
      required this.icon,
      this.pressFunction});

  final Color? color;
  final Color? backgroundColor;
  final IconData icon;
  final Function()? pressFunction;
  final double? iconSize;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 25,
      foregroundColor: color,
      backgroundColor: backgroundColor,
      child: IconButton(
        splashColor: color,
        onPressed: pressFunction,
        icon: Icon(icon),
        iconSize: iconSize,
      ),
    );
  }
}
