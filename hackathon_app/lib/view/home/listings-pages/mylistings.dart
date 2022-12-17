import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/indicator/loading_indicator.dart';

import '../../../core/components/elevatedButton/custom_elevatedbutton.dart';
import '../../../core/constants/app/colors.dart';

class Mylistings extends StatefulWidget {
  Mylistings({super.key});

  AppController controller = Get.find();

  @override
  State<Mylistings> createState() => _MylistingsState();
}

class _MylistingsState extends State<Mylistings> {
  final RoundedRectangleBorder _borderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.controller.myListingList.isEmpty
          ? _emptyList()
          : _listingItems(),
    );
  }

  Widget _emptyList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/svg/not-found.svg',
            width: MediaQuery.of(context).size.width / 1.5,
          ),
          const Text(
            'You have no listings yet',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 4.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  )
                ]),
          ),
          Container(
            padding: const EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width / 1.7,
            child: CustomElevatedButton(
              fun: () {},
              text: 'Create one now!',
            ),
          ),
        ],
      ),
    );
  }

  ListView _listingItems() {
    return ListView.builder(
      itemCount: widget.controller.myListingList.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 0, bottom: 8.0, left: 12, right: 12),
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
    );
  }

  Align _imgAlign(int index, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        child: SizedBox(
          child: CachedNetworkImage(
            imageUrl: widget.controller.myListingList[index].photos[0],
            fit: BoxFit.cover,
            progressIndicatorBuilder: ((context, url, progress) {
              return const LoadingIndicator();
            }),
          ),
          // child: Image.network(
          //   widget.controller.myListingList[index].photos[0],
          //   width: 150,
          //   height: 200,
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }

  Flexible _cardTexts(int index, BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardItemsPadding(_listingTitle(index, context), 16),
              _cardItemsPadding(_listingDescText(index, context), 4),
            ],
          ),
          Column(
            children: [
              _cardItemsPadding(
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _richText(
                      context,
                      const Icon(Icons.remove_red_eye, color: colorWhite),
                      " 0",
                    ),
                    _richText(
                      context,
                      const Icon(Icons.favorite, color: colorWhite),
                      widget.controller.myListingList[index].likes.length
                          .toString(),
                    ),
                  ],
                ),
                4,
              ),
            ],
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
      widget.controller.myListingList[index].description,
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
        widget.controller.myListingList[index].title,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: colorWhite,
            ),
      ),
    );
  }
}
