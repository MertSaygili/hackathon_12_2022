import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/icon_buttons/circle_icon_button.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

import '../../core/components/floating_action_button/floating_action_button.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final String _nameHint = 'Name';
  final String _descriptionHint = 'About';
  final String _phoneHint = 'Phone';
  final String _birthdateHint = "Birth date";
  String _name = '';
  String _description = '';
  String _phone = '';
  // TODO BURASI DATE OLACAK
  String _birthdate = "";

  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController aboutEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController birthDateEditingController =
      TextEditingController();

  AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    nameEditingController.text = controller.currentUser!.username;
    aboutEditingController.text = controller.currentUser!.about;
    phoneEditingController.text = controller.currentUser!.phone;
    birthDateEditingController.text = controller.currentUser!.birthDate;
    return Scaffold(
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
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: CustomTextField(
                              textEditingController: phoneEditingController,
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
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: CustomTextField(
                            textEditingController: birthDateEditingController,
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
    );
  }

  Row _logoAndInputs(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /* CircleAvatar(
          radius: 60,
          backgroundColor: colorPrimary,
          foregroundImage: NetworkImage(
              controller.currentUser!.profilePhoto != ""
                  ? controller.currentUser!.profilePhoto
                  : 'https://www.pngarts.com/files/3/Avatar-PNG-Picture.png'),
        ), */
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 200,
              child: CustomTextField(
                textEditingController: nameEditingController,
                fun: _setName,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                isRoundedBorder: true,
                obscureText: false,
                hintText: _nameHint,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 200,
              child: CustomTextField(
                textEditingController: aboutEditingController,
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
}
