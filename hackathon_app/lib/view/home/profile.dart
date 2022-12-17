import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/divider/custom_line_divider.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/components/gridview/listings_gridview.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppController controller = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: colorWhite,
              child: controller.currentUser!.profilePhoto != ''
                  ? Image.network(
                      controller.currentUser!.profilePhoto,
                    )
                  : Image.asset(logoUrlSmall),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CustomLineDivider(
                lineColor: colorPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Active Listings",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    height: 1,
                    color: colorBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'BalooBhaina',
                    shadows: <Shadow>[
                      const Shadow(
                        blurRadius: 4.0,
                        color: Color.fromARGB(150, 0, 0, 0),
                      )
                    ]),
              ),
            ),
            const ListingsGridView(),
            CustomElevatedButton(
                fun: () {
                  controller.signOut();
                },
                text: "Sign Out"),
          ],
        ),
      ),
    );
  }
}
