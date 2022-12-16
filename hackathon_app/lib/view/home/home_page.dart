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
  final String _dummyImage = 'assets/images/jpg/listing-foto-1.jpg';

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
            _listings(context),
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

  GridView _listings(BuildContext context) {
    int axisCount = 2;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisCount,
      ),
      itemBuilder: ((context, index) {
        return Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: colorPrimary,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      _alignImage(''),
                      _alignFavButton(),
                    ],
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(top: 4, left: 4),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _alignTitle(context, ''),
                        _alignSubtitle(context, ''),
                        _alignRow(context, ''),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Padding _alignRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.location_on, color: colorWhite),
          Text(
            'Peru, Brazil',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: colorWhite),
          )
        ],
      ),
    );
  }

  Padding _alignSubtitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        'Lorem ipsum is simpy sumyy text of printing and typesetting',
        maxLines: 2,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              fontSize: 12,
              color: colorWhite,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }

  Align _alignTitle(BuildContext context, String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Listing title - 1',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: 18,
              color: colorWhite,
            ),
      ),
    );
  }

  Padding _alignFavButton() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            color: colorPrimary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 24,
            padding: EdgeInsets.zero,
            color: colorWhite,
            onPressed: () {},
            icon: const Icon(
              Icons.heart_broken,
            ),
          ),
        ),
      ),
    );
  }

  Align _alignImage(String imgPath) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Image.asset(
          _dummyImage,
          fit: BoxFit.cover,
          height: 125,
        ),
      ),
    );
  }
}
