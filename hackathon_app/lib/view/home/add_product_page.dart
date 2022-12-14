import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/dropdown_menu/dropdown.dart';
import 'package:hackathon_app/core/components/floating_action_button/floating_action_button.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/components/indicator/loading_indicator.dart';
import '../../core/constants/app/icons.dart';
import '../../core/constants/enums/categories.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: AppController.listingId,
      builder: (AppController controller) => _Body(
        controller: controller,
        pageController: pageController,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  _Body({
    required this.controller,
    required this.pageController,
  });

  final AppController controller;
  final PageController pageController;
  final String _listingTitleText = 'Listing Title';
  final String _priceText = 'Price';
  final String _locationText = 'Location';
  final String _priceHint = 'Enter your sale price';
  final String _listingTitleHint = 'Enter your title';
  final String _locationHint = 'Country';
  final String _stateHint = 'State';
  final String _chooseLocation = 'Choose location';
  final String _descriptionText = 'Description';
  final String _descriptionHint = 'Enter descripe of product';
  CategoriesType _category = CategoriesType.unknown;
  String _title = '';
  String _description = '';
  double _price = 0.0;
  String _location = '';
  String _state = '';
  bool _loading = false;

  List photos = [];

  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController descriptionEditingController =
      TextEditingController();
  final TextEditingController priceEditingController = TextEditingController();
  final TextEditingController locationEditingController =
      TextEditingController();
  final TextEditingController stateEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 45.0)),
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              DropDownCategories(fun: _getCat),
              _setTitleAlign(context, _listingTitleText),
              CustomTextField(
                textEditingController: titleEditingController,
                fun: _setTitle,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                isRoundedBorder: true,
                obscureText: false,
                hintText: _listingTitleHint,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter a title!";
                  }
                  return null;
                },
              ),
              _customDivider(context),
              _setTitleAlign(context, _descriptionText),
              CustomTextField(
                textEditingController: descriptionEditingController,
                fun: _setDescp,
                inputType: TextInputType.multiline,
                minLine: 1,
                isRoundedBorder: true,
                obscureText: false,
                hintText: _descriptionHint,
                maxLines: 2,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter a description!";
                  }
                  return null;
                },
              ),
              _customDivider(context),
              _setTitleAlign(context, _priceText),
              CustomTextField(
                textEditingController: priceEditingController,
                fun: _setPrice,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                isRoundedBorder: true,
                obscureText: false,
                hintText: _priceHint,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter a price!";
                  }
                  return null;
                },
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
                            textEditingController: locationEditingController,
                            fun: _setCountry,
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            isRoundedBorder: true,
                            obscureText: false,
                            hintText: _locationHint,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter your country!";
                              }
                              return null;
                            },
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
                            textEditingController: stateEditingController,
                            fun: _setState,
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            isRoundedBorder: true,
                            obscureText: false,
                            hintText: _stateHint,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter your state!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              _customDivider(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _customDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(
        color: colorGrey,
        thickness: 0.5,
        endIndent: MediaQuery.of(context).size.width / 100,
        indent: MediaQuery.of(context).size.width / 100,
      ),
    );
  }

  Align _setTitleAlign(BuildContext context, String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: 15,
                )),
      ),
    );
  }

  Padding _floatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 1.3,
        right: 0,
      ),
      child: CustomFloatingActionButton(
        iconSize: 30,
        fun: () async {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const LoadingIndicator();
            },
          );

          if (formKey.currentState!.validate() &&
              controller.images.isNotEmpty) {
            await controller.addListing(
                _price, _title, _description, _location, _state, _category);
            priceEditingController.text = "";
            titleEditingController.text = "";
            descriptionEditingController.text = "";
            locationEditingController.text = "";
            stateEditingController.text = "";
            controller.images.clear();
            controller.update([AppController.listingId]);
            Navigator.of(context).pop();
            pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
          } else if (controller.images.isEmpty) {
            Get.snackbar("Pictures", "Please pick atleast 1 picture!");
          }
        },
        icon: Icons.send,
      ),
    );
  }

  void _getCat(int index) => _category = CategoriesType.values[index];
  void _setTitle(String val) => _title = val;
  void _setPrice(String val) => _price = val as double;
  void _setCountry(String val) => _location = val;
  void _setState(String val) => _state = val;
  void _setDescp(String val) => _description = val;
}
