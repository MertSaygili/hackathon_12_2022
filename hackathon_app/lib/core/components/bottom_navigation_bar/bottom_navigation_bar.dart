import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
    required this.items,
    required this.isText,
    this.elevation,
    this.backgroundColor,
  });

  final PageController controller;
  final List<BottomNavigationBarItem> items;
  final bool isText;
  final double? elevation;
  final Color? backgroundColor;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final double _iconSize = 32;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation ?? 8.0,
      currentIndex: _currentIndex,
      showSelectedLabels: widget.isText ? true : false,
      showUnselectedLabels: widget.isText ? true : false,
      iconSize: widget.isText ? 0 : _iconSize,
      selectedItemColor: widget.isText
          ? colorBlack
          : Theme.of(context).colorScheme.onBackground,
      selectedLabelStyle: widget.isText
          ? Theme.of(context).textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w600,
              shadows: <Shadow>[
                const Shadow(
                  blurRadius: 4.0,
                  color: Color.fromARGB(150, 0, 0, 0),
                )
              ],
            )
          : null,
      unselectedLabelStyle: widget.isText
          ? Theme.of(context).textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w400,
              shadows: <Shadow>[
                const Shadow(
                  blurRadius: 4.0,
                  color: Color.fromARGB(75, 0, 0, 0),
                )
              ],
            )
          : null,
      unselectedItemColor: widget.isText ? colorBlack : colorGrey,
      selectedIconTheme: const IconThemeData(color: colorPrimary),
      unselectedIconTheme: const IconThemeData(color: colorGrey),
      onTap: _onTap,
      items: widget.items,
    );
  }

  void _onTap(int index) {
    setState(() => _currentIndex = index);

    widget.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }
}
