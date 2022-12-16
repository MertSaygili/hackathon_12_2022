import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.preferedSize});

  final double preferedSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(preferedSize);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final double _elevation = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorTransparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: _elevation,
    );
  }
}
