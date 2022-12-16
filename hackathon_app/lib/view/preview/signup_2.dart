import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';

import '../../core/components/divider/custom_divider.dart';
import '../../core/components/icon_buttons/back_button.dart';
import '../../core/components/stack_image/stack_image.dart';
import '../../core/components/textfield/custom_textfield.dart';

class SignupTwoPreview extends StatefulWidget {
  const SignupTwoPreview({super.key});

  @override
  State<SignupTwoPreview> createState() => _SignupTwoPreviewState();
}

class _SignupTwoPreviewState extends State<SignupTwoPreview> {
  final Radius _radiusSheet = const Radius.circular(30);
  final String _infoText = 'Last steps for a amazing world\nof BarterBuddy';
  final String _register = 'Register';
  final String _bottomImagePath = 'assets/images/svg/reg-2.svg';
  bool _isPasswordObscure = true;
  String _email = '';
  String _password = '';

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
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    CustomIconButtons().backButton(context),
                    _titleText(context, _infoText),
                    _emailTextField(context),
                    _passwordTextField(context),
                    _registerButton(context),
                    const CustomTextDivider(),
                    _signUpText(),
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

  Padding _registerButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: CustomElevatedButton(fun: () {}, text: _register),
    );
  }

  Padding _passwordTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.25,
        child: CustomTextField(
          fun: _setPassword,
          inputType: TextInputType.visiblePassword,
          inputAction: TextInputAction.done,
          isRoundedBorder: true,
          obscureText: _isPasswordObscure,
          suffix: _visibilityIconButton(),
          hintText: passwordHint,
          maxLines: 1,
        ),
      ),
    );
  }

  Padding _emailTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.25,
        child: CustomTextField(
          fun: _setEmail,
          inputType: TextInputType.text,
          inputAction: TextInputAction.next,
          isRoundedBorder: true,
          obscureText: false,
          hintText: emailHint,
          isFilled: true,
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

  IconButton _visibilityIconButton() {
    return IconButton(
      onPressed: () => setState(
        () => _isPasswordObscure = !_isPasswordObscure,
      ),
      icon: _isPasswordObscure
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }

  Column _signUpText() {
    String anotherAccountText = 'Already have an account?';
    String signUpText = 'Login now!';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // ignore: prefer_const_constructors
        Text(
          anotherAccountText,
          style: const TextStyle(
            fontFamily: "ABeeZee",
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: () {}, // kullanici girisnin yapilacagi yer
          child: Text(
            signUpText,
            style: const TextStyle(
              color: colorPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  void _setPassword(String password) => setState(() => _password = password);
  void _setEmail(String email) => setState(() => _email = email);
}
