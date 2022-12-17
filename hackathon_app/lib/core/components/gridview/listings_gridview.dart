import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';

import '../../constants/app/colors.dart';

class ListingsGridView extends StatelessWidget {
  final bool isProfileScreen;
  const ListingsGridView({super.key, required this.isProfileScreen});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: AppController.listingId,
      builder: (AppController controller) => _Body(
        controller: controller,
        isProfileScreen: isProfileScreen,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final AppController controller;
  final bool isProfileScreen;
  const _Body({
    required this.controller,
    required this.isProfileScreen,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: isProfileScreen
          ? controller.myListingList.length
          : controller.listingList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 1.75,
          height: 250,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: colorPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    _alignImage(isProfileScreen
                        ? controller.myListingList[index].photos[0]
                        : controller.listingList[index].photos[0]),
                    _alignFavButton(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(top: 4, left: 4),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _alignTitle(
                            context,
                            isProfileScreen
                                ? controller.myListingList[index].title
                                : controller.listingList[index].title),
                        _alignSubtitle(
                            context,
                            isProfileScreen
                                ? controller.myListingList[index].description
                                : controller.listingList[index].description),
                        _alignRow(context,
                            "${isProfileScreen ? controller.myListingList[index].state : controller.listingList[index].state}, ${isProfileScreen ? controller.myListingList[index].country : controller.listingList[index].country}"),
                      ],
                    ),
                  ),
                )
              ],
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
            text,
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
        text,
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
        text,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: colorWhite,
            ),
        maxLines: 1,
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
              Icons.favorite,
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
        child: Image.network(
          imgPath,
          fit: BoxFit.cover,
          height: 140,
        ),
      ),
    );
  }
}
