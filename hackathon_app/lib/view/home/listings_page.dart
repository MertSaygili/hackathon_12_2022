import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class ListingsPage extends StatefulWidget {
  const ListingsPage({super.key});

  @override
  State<ListingsPage> createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage> {
  final String _dummyImage = 'assets/images/jpg/listing-foto-1.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _listings(context),
      ),
    );
  }

  SizedBox _listings(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.75,
      height: 250,
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
                  _alignImage(),
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

  Align _alignImage() {
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
