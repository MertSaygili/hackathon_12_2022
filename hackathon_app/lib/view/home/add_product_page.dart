import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/bottom_navigation_bar/page_view.dart';
import 'package:hackathon_app/view/home/listings-pages/favourites.dart';
import 'package:hackathon_app/view/home/listings-pages/mylistings.dart';

import '../../core/components/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../core/constants/app/colors.dart';
import '../../core/constants/app/strings.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late final PageController _controller = PageController();
  final List<Widget> _items = [];

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
