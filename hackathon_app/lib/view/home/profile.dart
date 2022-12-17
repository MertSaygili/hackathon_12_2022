import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';

import '../../core/components/gridview/listings_gridview.dart';
import '../../core/constants/app/colors.dart';
import '../../core/constants/app/strings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppController controller = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 32),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          // main column
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(logoUrlSmall),
              ),
            ),
            Expanded(flex: 2, child: _profileColumn()),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Divider(
                      color: colorPrimary,
                      thickness: 2,
                    ),
                    ListingsGridView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _profileColumn() {
    return Column(
      children: [
        _firstRow(),
        _secondRow(),
      ],
    );
  }

  Row _secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RichText(
          text: TextSpan(
            text: '',
            style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 16,
              color: colorGrey,
              shadows: <Shadow>[
                const Shadow(
                  blurRadius: 4.0,
                  color: Color.fromARGB(150, 0, 0, 0),
                )
              ],
            ),
            children: const [
              TextSpan(text: '4.1/5'),
              WidgetSpan(child: Icon(Icons.star, color: colorGrey))
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: '',
            style: Theme.of(context).textTheme.headline6?.copyWith(
              color: colorGrey,
              fontSize: 16,
              shadows: <Shadow>[
                const Shadow(
                  blurRadius: 4.0,
                  color: Color.fromARGB(150, 0, 0, 0),
                )
              ],
            ),
            children: const [
              WidgetSpan(child: Icon(Icons.calendar_month, color: colorGrey)),
              TextSpan(text: 'joined at December 2022'),
            ],
          ),
        )
      ],
    );
  }

  Row _firstRow() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: colorPrimary,
          foregroundImage: NetworkImage(
            'https://www.pngarts.com/files/3/Avatar-PNG-Picture.png',
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saltuk Bugra',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  'lorem ipsum is simply dummy text of the printing and type settings...',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: colorGrey,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
// SingleChildScrollView(
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       CircleAvatar(
//         backgroundColor: colorWhite,
//         child: controller.currentUser!.profilePhoto != ''
//             ? Image.network(
//                 controller.currentUser!.profilePhoto,
//               )
//             : Image.asset(logoUrlSmall),
//       ),
//       const Padding(
//         padding: EdgeInsets.only(top: 8.0),
//         child: CustomLineDivider(
//           lineColor: colorPrimary,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//         child: Text(
//           "Active Listings",
//           style: Theme.of(context).textTheme.headline6!.copyWith(
//               height: 1,
//               color: colorBlack,
//               fontSize: 20,
//               fontWeight: FontWeight.w800,
//               fontFamily: 'BalooBhaina',
//               shadows: <Shadow>[
//                 const Shadow(
//                   blurRadius: 4.0,
//                   color: Color.fromARGB(150, 0, 0, 0),
//                 )
//               ]),
//         ),
//       ),
//       const ListingsGridView(),
//       CustomElevatedButton(
//         fun: () {
//           controller.signOut();
//         },
//         text: "Sign Out",
//       ),
//     ],
//   ),
// ),
