import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/components/icon_buttons/back_button.dart';
import 'package:hackathon_app/core/components/stack_image/stack_image.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/view/preview/signup_2.dart';

import '../../core/components/textfield/custom_textfield.dart';

class SignupPreview extends StatefulWidget {
  const SignupPreview({super.key});

  @override
  State<SignupPreview> createState() => _SignupPreviewState();
}

class _SignupPreviewState extends State<SignupPreview> {
  final String _bottomImagePath = 'assets/images/svg/reg-1.svg';
  final String _infoText = 'With barter buddy\nenjoy your old stuffs';
  final Radius _radiusSheet = const Radius.circular(15);
  final String _usernameHint = 'Username';
  String _username = '';
  bool _hasAvatarChoosen = false;

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

  Padding _textField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.25,
        child: CustomTextField(
          fun: () {},
          inputType: TextInputType.text,
          inputAction: TextInputAction.done,
          isRoundedBorder: true,
          obscureText: false,
          hintText: _usernameHint,
          isFilled: false,
        ),
      ),
    );
  }

  Padding _avatarButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        onTap: () {}, // bastiginda
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 6,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: colorPrimary,
          ),
          child: _hasAvatarChoosen
              ? CircleAvatar(
                  backgroundImage: Image.network(
                    '',
                    fit: BoxFit.contain,
                  ).image,
                )
              : IconButton(
                  icon: Icon(
                    Icons.add,
                    color: colorWhite,
                    size: MediaQuery.of(context).size.height / 7,
                  ),
                  onPressed: () {},
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

  void _navigateNextPage() => Get.to(() => const SignupTwoPreview());
}
