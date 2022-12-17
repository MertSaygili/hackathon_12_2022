import 'package:flutter/material.dart';

import '../../core/components/appbar/custom_appbar.dart';
import '../../core/components/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../core/components/bottom_navigation_bar/page_view.dart';
import '../../core/constants/app/colors.dart';
import '../../core/constants/app/strings.dart';
import 'listings-pages/favourites.dart';
import 'listings-pages/mylistings.dart';

class ListingsPage extends StatefulWidget {
  const ListingsPage({super.key});

  @override
  State<ListingsPage> createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage> {
  late final PageController _controller = PageController();
  final List<Widget> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Image.asset(logoUrlSmall),
            ),
          ),
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
            flex: 10,
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
