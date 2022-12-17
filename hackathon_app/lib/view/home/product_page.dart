import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/divider/custom_line_divider.dart';
import 'package:hackathon_app/core/components/icon_buttons/circle_icon_button.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: colorScaffold,
        preferedSize: 55,
        backButton: true,
        actions: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(logoUrlSmall, height: 50),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImage(context),
            _productPriceAndLocation(context),
            _productTitle(context),
            _productSeller(context),
            const CustomLineDivider(
              lineColor: colorPrimary,
            ),
            _productDescription(context),
            const CustomLineDivider(
              lineColor: colorPrimary,
            ),
            _productLocation(context)
          ],
        ),
      ),
    );
  }

  Padding _productLocation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
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
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.network(
              "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iNv8NMTH4cSc/v0/1200x-1.png",
            ),
          ),
        ],
      ),
    );
  }

  Padding _productDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
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
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five ",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    height: 1,
                    color: colorBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'BalooBhaina',
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _productSeller(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    "About Seller",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          height: 1,
                          color: colorGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'BalooBhaina',
                        ),
                  ),
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: colorPrimary,
                    foregroundImage: NetworkImage(
                        'https://www.pngarts.com/files/3/Avatar-PNG-Picture.png'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            height: 1.3,
                            color: colorGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BalooBhaina',
                          ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      "Mert İnan Saygılı",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            height: 1.3,
                            color: colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BalooBhaina',
                          ),
                    ),
                    Text(
                      "Seller Point",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            height: 1.3,
                            color: colorGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BalooBhaina',
                          ),
                    ),
                    _reverseRichText(
                        context,
                        const Icon(
                          Icons.star,
                          size: 20,
                        ),
                        "4.1/5 ",
                        14)
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleIconButton(
                icon: Icons.phone,
                pressFunction: () {},
                backgroundColor: colorPrimary,
                color: colorWhite,
              ),
              Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: const Text(
                    "Member since December 2022",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Padding _productTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "An used black sofa set",
        style: Theme.of(context).textTheme.headline6!.copyWith(
              height: 1,
              color: colorBlack,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: 'BalooBhaina',
            ),
      ),
    );
  }

  Padding _productPriceAndLocation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "1.251\$",
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
          _richText(
              context,
              const Icon(
                Icons.location_on_outlined,
                color: colorPrimary,
              ),
              "Ankara, Turkey")
        ],
      ),
    );
  }

  Image _productImage(BuildContext context) {
    return Image.asset(
      'assets/images/jpg/listing-foto-1.jpg',
      height: MediaQuery.of(context).size.height / 2.6,
      fit: BoxFit.cover,
    );
  }

  Padding _richText(BuildContext context, Widget icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style.copyWith(
                color: colorBlack,
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

  Padding _reverseRichText(
      BuildContext context, Widget icon, String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style.copyWith(
                color: colorBlack,
                fontSize: fontSize,
              ),
          children: [
            TextSpan(text: text),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
