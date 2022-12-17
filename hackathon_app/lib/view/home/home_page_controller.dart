import 'package:flutter/material.dart';
import 'package:hackathon_app/view/home/add_product_page.dart';
import 'package:hackathon_app/view/home/edit-profile.dart';
import 'package:hackathon_app/view/home/home_page.dart';
import 'package:hackathon_app/view/home/listings_page.dart';
import 'package:hackathon_app/view/home/product_page.dart';
import 'package:hackathon_app/view/home/profile.dart';
import '../../core/components/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../core/components/bottom_navigation_bar/page_view.dart';

class HomePageControllerView extends StatefulWidget {
  const HomePageControllerView({super.key});

  @override
  State<HomePageControllerView> createState() => _HomePageControllerViewState();
}

class _HomePageControllerViewState extends State<HomePageControllerView> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      _bottomNavigationBarItem(_customIcons(Icons.home), ''),
      _bottomNavigationBarItem(_customIcons(Icons.add_box_outlined), ''),
      _bottomNavigationBarItem(_customIcons(Icons.list_alt_outlined), ''),
      _bottomNavigationBarItem(_customIcons(Icons.person), ''),
      _bottomNavigationBarItem(_customIcons(Icons.temple_buddhist), ''),
    ];

    List<Widget> pageItems = [
      const HomePageView(),
      const AddProductPage(),
      const ListingsPage(),
      const ProfilePage(),
      const EditProfileView(),
    ];

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        controller: _controller,
        items: items,
        isText: false,
      ),
      body: CustomPageView(controller: _controller, items: pageItems),
    );
  }

  Icon _customIcons(IconData icon) => Icon(icon);

  BottomNavigationBarItem _bottomNavigationBarItem(Icon icon, String text) {
    return BottomNavigationBarItem(
      icon: icon,
      label: text,
    );
  }
}
