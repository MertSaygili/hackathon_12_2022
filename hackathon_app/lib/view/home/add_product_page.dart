import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/components/floating_action_button/floating_action_button.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
            child: _addImage(),
          ),
          Expanded(
            flex: 5,
            child: _setInformation(),
          )
        ],
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Container _addImage() {
    return Container(color: colorGrey);
  }

  Widget _setInformation() {
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
            _setTitleAlign(_listingTitleText),
            CustomTextField(
              fun: () => _setTitle,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              isRoundedBorder: true,
              obscureText: false,
              hintText: _listingTitleHint,
            ),
            _customDivider(),
            _setTitleAlign(_priceText),
            CustomTextField(
              fun: () => _setPrice,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              isRoundedBorder: true,
              obscureText: false,
              hintText: _priceHint,
            ),
            _customDivider(),
            _setTitleAlign(_locationText),
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
            _customDivider(),
            Center(
              child: CustomElevatedButton(fun: () {}, text: _chooseLocation),
            )
          ],
        ),
      ),
    );
  }

  Divider _customDivider() {
    return Divider(
      color: colorGrey,
      thickness: 0.8,
      endIndent: MediaQuery.of(context).size.width / 50,
      indent: MediaQuery.of(context).size.width / 50,
    );
  }

  Align _setTitleAlign(String text) {
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

  void _setTitle(String val) => setState(() => _title = val);
  void _setPrice(String val) => setState(() => _price = val);
  void _setCountry(String val) => setState(() => _location = val);
  void _setState(String val) => setState(() => _state = val);
}
