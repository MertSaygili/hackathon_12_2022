import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/icons.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.preferedSize,
    required this.backButton,
    this.backgroundColor,
  });

  final double preferedSize;
  final Color? backgroundColor;
  final bool backButton;

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
      backgroundColor: widget.backgroundColor ?? colorTransparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: _elevation,
      leading: widget.backButton ? _backButton() : null,
      bottomOpacity: 0,
    );
  }

  IconButton _backButton() => IconButton(
        padding: EdgeInsets.zero,
        icon: iconBackButton,
        onPressed: () => Navigator.of(context).pop(),
      );
}
