import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/floating_action_button/floating_action_button.dart';
import 'package:hackathon_app/core/components/gridview/listings_gridview.dart';
import 'package:hackathon_app/core/components/icon_buttons/circle_icon_button.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';
import 'package:hackathon_app/core/components/divider/custom_line_divider.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

import '../../core/constants/app/strings.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String _nameHint = 'Name';
  String _descriptionHint = 'About';
  String _emailHint = 'Email';
  String _phoneHint = 'Phone';
  String _birthdateHint = "Birth date";
  String _name = '';
  String _description = '';
  String _email = '';
  String _phone = '';
  // TODO BURASI DATE OLACAK
  String _birthdate = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          fun: () => {},
          icon: Icons.send,
        ),
        appBar: const CustomAppBar(
          backButton: true,
          preferedSize: 75,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: _logoAndInputs(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleIconButton(
                            iconSize: 35,
                            radius: 35,
                            backgroundColor: colorPrimary,
                            color: colorWhite,
                            icon: Icons.mail,
                            pressFunction: () => {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: CustomTextField(
                              fun: _setEmail,
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                              isRoundedBorder: true,
                              obscureText: false,
                              hintText: _emailHint,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            CircleIconButton(
                              iconSize: 35,
                              radius: 35,
                              backgroundColor: colorPrimary,
                              color: colorWhite,
                              icon: Icons.phone,
                              pressFunction: () => {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: CustomTextField(
                                fun: _setPhone,
                                inputType: TextInputType.text,
                                inputAction: TextInputAction.next,
                                isRoundedBorder: true,
                                obscureText: false,
                                hintText: _phoneHint,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CircleIconButton(
                            iconSize: 35,
                            radius: 35,
                            backgroundColor: colorPrimary,
                            color: colorWhite,
                            icon: Icons.calendar_month,
                            pressFunction: () => {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: CustomTextField(
                              fun: _setBirthdate,
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                              isRoundedBorder: true,
                              obscureText: false,
                              hintText: _birthdateHint,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.6,
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      'assets/images/svg/profile.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _logoAndInputs(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: colorPrimary,
          foregroundImage: NetworkImage(
              'https://www.pngarts.com/files/3/Avatar-PNG-Picture.png'),
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 200,
              child: CustomTextField(
                fun: _setName,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                isRoundedBorder: true,
                obscureText: false,
                hintText: _nameHint,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 200,
              child: CustomTextField(
                fun: _setAbout,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                isRoundedBorder: true,
                obscureText: false,
                hintText: _descriptionHint,
              ),
            ),
          ],
        )
      ],
    );
  }

  void _setName(String val) => _name = val;
  void _setBirthdate(String val) => _birthdate = val;
  void _setAbout(String val) => _description = val;
  void _setPhone(String val) => _phone = val;
  void _setEmail(String val) => _email = val;
}
