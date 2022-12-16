import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView(
      {super.key, required this.controller, required this.items});

  final PageController controller;
  final List<Widget> items;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: _setNewPage,
      children: widget.items,
    );
  }

  void _setNewPage(int index) => setState(() => index = _currentIndex);
}
