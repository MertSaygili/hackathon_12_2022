import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/icon_buttons/circle_icon_button.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class ListingsPage extends StatefulWidget {
  const ListingsPage({super.key});

  @override
  State<ListingsPage> createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage> {
  final RoundedRectangleBorder _borderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12, right: 12),
            child: SizedBox(
              height: 170,
              child: Card(
                shape: _borderRadius,
                elevation: 15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: colorPrimary,
                    shape: _borderRadius,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _imgAlign(index, context),
                      _cardTexts(index, context),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Align _imgAlign(int index, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            child: Image.asset(
              'assets/images/jpg/listing-foto-${index + 1}.jpg',
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Flexible _cardTexts(int index, BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cardItemsPadding(_listingTitle(index, context), 16),
          _cardItemsPadding(_listingDescText(index, context), 4),
          _cardItemsPadding(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _richText(
                  context,
                  const Icon(Icons.remove_red_eye, color: colorWhite),
                  " 1251",
                ),
                _richText(
                  context,
                  const Icon(Icons.favorite, color: colorWhite),
                  " 21",
                ),
              ],
            ),
            4,
          )
        ],
      ),
    );
  }

  Padding _richText(BuildContext context, Widget icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style.copyWith(
                color: colorWhite,
              ),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: icon,
            ),
            TextSpan(text: text)
          ],
        ),
      ),
    );
  }

  Padding _cardItemsPadding(Widget child, double vertical) {
    return Padding(
      padding: EdgeInsets.only(left: 8, top: vertical, right: 8, bottom: 8),
      child: child,
    );
  }

  Text _listingDescText(int index, BuildContext context) {
    return Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting",
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: colorWhite,
          ),
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      maxLines: 4,
    );
  }

  Align _listingTitle(int index, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Listing item - 1",
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: colorWhite,
            ),
      ),
    );
  }

  void _floatingActionFun() {}
}
