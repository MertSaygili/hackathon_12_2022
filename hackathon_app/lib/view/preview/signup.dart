import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/components/icon_buttons/back_button.dart';
import 'package:hackathon_app/core/components/stack_image/stack_image.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/icons.dart';
import 'package:hackathon_app/view/preview/signup_2.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/base/controllers/app_controller.dart';
import '../../core/components/gridview/custom_gridview.dart';
import '../../core/components/textfield/custom_textfield.dart';

class SignupPreview extends StatefulWidget {
  const SignupPreview({super.key});

  @override
  State<SignupPreview> createState() => _SignupPreviewState();
}

class _SignupPreviewState extends State<SignupPreview> {
  final String _bottomImagePath = 'assets/images/svg/reg-1.svg';
  final String _infoText = 'With barter buddy\nenjoy your old stuffs';
  final Radius _radiusSheet = const Radius.circular(30);
  final String _usernameHint = 'Username';
  final String _pathAvatar = 'assets/images/avatar/avatar_';

  String _username = '';
  String _currentImageId = '';
  bool _hasAvatarChoosen = false;

  final formKey = GlobalKey<FormState>();
  AppController controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              color: colorScaffold,
              borderRadius: BorderRadius.only(
                bottomLeft: _radiusSheet,
                bottomRight: _radiusSheet,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    CustomIconButtons().backButton(context),
                    _titleText(context, _infoText),
                    _avatarButton(context),
                    _textField(context),
                    _nextPageButton(context),
                  ],
                ),
              ),
            ),
          ),
          StackImage().bottomImage(context, _bottomImagePath),
        ],
      ),
    );
  }

  Form _textField(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.25,
          child: CustomTextField(
            fun: (String value) {
              _setUsername(value);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your username!";
              } else if (controller.userList
                  .any((element) => element.username == _username)) {
                return "This username is in use.";
              }
              return null;
            },
            inputType: TextInputType.text,
            inputAction: TextInputAction.done,
            isRoundedBorder: true,
            obscureText: false,
            hintText: _usernameHint,
            isFilled: false,
          ),
        ),
      ),
    );
  }

  Padding _avatarButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
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
                        onTap: () => controller.pickImage(ImageSource.gallery),
                        leading: iconGallery,
                        title: const Text("Select photo from gallery"),
                      ),
                      // TODO: Avator bottom sheet
                      ListTile(
                        onTap: () {
                          _bottomSheetGridModal();
                        },
                        leading: iconPerson,
                        title: const Text("Select from our custom avatars"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }, // bastiginda
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 6,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: colorPrimary,
          ),
          child: _hasAvatarChoosen
              ? CircleAvatar(
                  backgroundImage: Image.asset(
                    '$_bottomImagePath$_currentImageId.png',
                    fit: BoxFit.contain,
                  ).image,
                )
              : Icon(
                  Icons.add,
                  color: colorWhite,
                  size: MediaQuery.of(context).size.height / 7,
                ),
        ),
      ),
    );
  }

  Padding _nextPageButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width / 10,
        top: 16,
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_forward,
            color: colorPrimary,
            size: 36,
          ),
          onPressed: _navigateNextPage,
        ),
      ),
    );
  }

  Text _titleText(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }

  void _bottomSheetGridModal() async {
    final response = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CustomGridView().gridView(41, _pathAvatar);
        });
    _setImage(response);
  }

  void _setImage(String? path) {
    if (path != null) {
      setState(() {
        _currentImageId = path;
        _hasAvatarChoosen = true;
      });
    }
  }

  void _navigateNextPage() {
    if (formKey.currentState!.validate()) {
      Get.to(() => const SignupTwoPreview());
    }
  }

  void _setUsername(String username) => () => _username = username;
}
