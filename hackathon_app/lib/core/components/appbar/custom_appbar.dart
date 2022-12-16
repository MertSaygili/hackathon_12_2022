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
    this.leading,
    this.actions,
    this.title,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? actions;
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
      title: widget.title,
      centerTitle: true,
      backgroundColor: widget.backgroundColor ?? colorTransparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: _elevation,
      leading: widget.leading ?? (widget.backButton ? _backButton() : null),
      actions: [widget.actions ?? const SizedBox()],
      bottomOpacity: 0,
    );
  }

  IconButton _backButton() => IconButton(
        padding: EdgeInsets.zero,
        icon: iconBackButton,
        onPressed: () => Navigator.of(context).pop(),
      );
}
