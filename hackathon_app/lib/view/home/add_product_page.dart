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
    return Scaffold(
      appBar: CustomAppBar(
        preferedSize: 75,
        backButton: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Image.asset(logoUrlSmall, height: 55),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.zero,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 30,
                child: _navigationBar(),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomPageView(
              controller: _controller,
              items: const [
                Mylistings(),
                Favourites(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomBottomNavigationBar _navigationBar() {
    List<BottomNavigationBarItem> items = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.hourglass_empty),
        label: 'My listings',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.hourglass_empty),
        label: 'Favourites',
      ),
    ];

    return CustomBottomNavigationBar(
      controller: _controller,
      items: items,
      isText: true,
      elevation: 0,
      backgroundColor: colorTransparent,
    );
  }
}
