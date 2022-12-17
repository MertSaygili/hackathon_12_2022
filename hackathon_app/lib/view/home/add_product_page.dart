import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/components/floating_action_button/floating_action_button.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
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
    required this.controller,
  });

  final AppController controller;

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
  String _title = '';
  String _description = '';
  double _price = 0.0;
  String _location = '';
  String _state = '';

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
              Center(
                child: CustomElevatedButton(fun: () {}, text: _chooseLocation),
              )
            ],
          ),
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
        bottom: MediaQuery.of(context).size.height / 1.35,
        right: 0,
      ),
      child: CustomFloatingActionButton(
        fun: () async {
          if (formKey.currentState!.validate() &&
              controller.images.isNotEmpty) {
            await controller.addListing(
                _price, _title, _description, _location, _state);
            priceEditingController.text = "";
            titleEditingController.text = "";
            descriptionEditingController.text = "";
            locationEditingController.text = "";
            stateEditingController.text = "";
            controller.images.clear();
            controller.update([AppController.listingId]);
          } else if (controller.images.isEmpty) {
            Get.snackbar("Pictures", "Please pick atleast 1 picture!");
          }
        },
        icon: Icons.save,
      ),
    );
  }

  void _setTitle(String val) => _title = val;
  void _setPrice(String val) => _price = val as double;
  void _setCountry(String val) => _location = val;
  void _setState(String val) => _state = val;
  void _setDescp(String val) => _description = val;
}
