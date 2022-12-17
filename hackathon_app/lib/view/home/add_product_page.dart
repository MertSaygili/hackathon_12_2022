import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/components/floating_action_button/floating_action_button.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/app/icons.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: AppController.listingId,
      builder: (AppController controller) => _Body(
        controller: controller,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  _Body({
    super.key,
    required this.controller,
  });

  final AppController controller;

  final String _dummyImg = 'assets/images/jpg/listing-foto-1.jpg';
  final String _listingTitleText = 'Listing Title';
  final String _priceText = 'Price';
  final String _locationText = 'Location';
  final String _priceHint = 'Enter your sale price';
  final String _listingTitleHint = 'Enter your title';
  final String _locationHint = 'Country';
  final String _stateHint = 'State';
  final String _chooseLocation = 'Choose location';
  String _title = '';
  String _price = '';
  String _location = '';
  String _state = '';

  List photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        backgroundColor: colorScaffold,
        preferedSize: 55,
        backButton: true,
        actions: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(logoUrlSmall, height: 50),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: _addImage(context),
          ),
          Expanded(
            flex: 5,
            child: _setInformation(context),
          )
        ],
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Widget _addImage(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: List.generate(
        controller.images.isEmpty ? 1 : controller.images.length,
        (index) => GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
              ),
              builder: (context) => Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => controller.pickImage(ImageSource.camera),
                          leading: iconCamera,
                          title: const Text(
                            "Take photo from camera",
                          ),
                        ),
                        ListTile(
                          onTap: () =>
                              controller.pickImage(ImageSource.gallery),
                          leading: iconGallery,
                          title: const Text("Select photo from gallery"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: const BoxDecoration(color: colorSecondryScaffold),
            child: controller.images.isEmpty
                ? iconCameraAlt
                : Image.file(controller.images[index]!),
          ),
        ),
      ),
    );
  }

  Widget _setInformation(BuildContext context) {
    double paddingVal = 12;

    return Padding(
      padding: EdgeInsets.only(
        top: paddingVal,
        left: paddingVal,
        right: paddingVal,
        bottom: 4,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _setTitleAlign(context, _listingTitleText),
            CustomTextField(
              fun: () => _setTitle,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              isRoundedBorder: true,
              obscureText: false,
              hintText: _listingTitleHint,
            ),
            _customDivider(context),
            _setTitleAlign(context, _priceText),
            CustomTextField(
              fun: () => _setPrice,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              isRoundedBorder: true,
              obscureText: false,
              hintText: _priceHint,
            ),
            _customDivider(context),
            _setTitleAlign(context, _locationText),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomTextField(
                          fun: () => _setCountry,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.done,
                          isRoundedBorder: true,
                          obscureText: false,
                          hintText: _locationHint,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          fun: () => _setState,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.done,
                          isRoundedBorder: true,
                          obscureText: false,
                          hintText: _stateHint,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            _customDivider(context),
            Center(
              child: CustomElevatedButton(fun: () {}, text: _chooseLocation),
            )
          ],
        ),
      ),
    );
  }

  Divider _customDivider(BuildContext context) {
    return Divider(
      color: colorGrey,
      thickness: 0.8,
      endIndent: MediaQuery.of(context).size.width / 50,
      indent: MediaQuery.of(context).size.width / 50,
    );
  }

  Align _setTitleAlign(BuildContext context, String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(text, style: Theme.of(context).textTheme.headline5),
    );
  }

  Padding _floatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height / 1.5,
        right: 0,
      ),
      child: CustomFloatingActionButton(
        fun: () {},
        icon: Icons.save,
      ),
    );
  }

  void _setTitle(String val) => () => _title = val;
  void _setPrice(String val) => () => _price = val;
  void _setCountry(String val) => () => _location = val;
  void _setState(String val) => () => _state = val;
}
