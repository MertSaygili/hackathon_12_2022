import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/icon_buttons/circle_icon_button.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';
import 'package:hackathon_app/core/components/divider/custom_line_divider.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

import '../../core/constants/app/strings.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  // Create a list that holds icons
  final List<IconData> _icons = <IconData>[
    Icons.electric_bolt,
    Icons.bed_outlined,
    Icons.baby_changing_station,
    Icons.sports_basketball_outlined,
    Icons.person_outline,
    Icons.laptop,
  ];

  // Create a list that holds categories
  final List<String> _categoriesText = <String>[
    'Electronics',
    'Furniture',
    'Baby',
    'Sports',
    'Fashion',
    'Laptops',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: CustomAppBar(
          leading: Image.asset(logoUrlSmall),
          actions: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: CustomTextField(
              fun: () {},
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
              isRoundedBorder: true,
              obscureText: false,
              suffix: const Icon(Icons.search, size: 32),
            ),
          ),
          backButton: false,
          preferedSize: 75,
        ),
        body: Column(
          children: [
            _categories(),
          ],
        ),
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomLineDivider(
            lineColor: colorPrimary,
          ),
          Text(
            "Categories",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                height: 1,
                color: colorBlack,
                fontSize: 25,
                fontWeight: FontWeight.w800,
                fontFamily: 'BalooBhaina',
                shadows: <Shadow>[
                  const Shadow(
                    blurRadius: 4.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  )
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        CircleIconButton(
                          backgroundColor: colorPrimary,
                          color: colorWhite,
                          radius: 30,
                          iconSize: 35,
                          icon: _icons[index],
                          pressFunction: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(_categoriesText[index],
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic)),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
