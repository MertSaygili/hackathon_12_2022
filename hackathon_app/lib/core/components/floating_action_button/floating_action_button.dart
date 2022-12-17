import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    this.backgroundColor,
    this.iconColor,
    required this.icon,
    required this.fun,
  });

  final Function fun;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FloatingActionButton(
        backgroundColor: backgroundColor ?? colorPrimary,
        mini: true,
        onPressed: () => fun(),
        child: Icon(icon, color: iconColor, size: 40),
      ),
    );
  }
}
