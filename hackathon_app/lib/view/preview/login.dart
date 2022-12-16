import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/constants/app/icons.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';
import 'package:hackathon_app/view/preview/signup.dart';

import '../../core/components/textfield/custom_textfield.dart';
import '../../core/constants/app/colors.dart';
import '../../core/constants/custom_divider.dart';

class LoginPreview extends StatefulWidget {
  const LoginPreview({super.key});

  @override
  State<LoginPreview> createState() => _LoginPreviewState();
}

class _LoginPreviewState extends State<LoginPreview> {
  final int _flex = 1;
  final String _login = 'Log in';
  final String _usernameHint = 'Username';
  final String _passwordHint = 'Password';
  bool _isPasswordObscure = true;

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(preferedSize: 0, backButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _expanded(
              _flex * 3,
              Image.asset(logoUrl),
            ),
            _expanded(_flex * 3, _inputfieldColumn()),
            _expanded(_flex * 2, _loginButton()),
            const CustomTextDivider(
              textColor: colorGrey,
              lineColor: colorPrimary,
            ),
            _signUpText(),
          ],
        ),
      ),
    );
  }

  Column _signUpText() {
    String anotherAccountText = 'Henüz bir hesabın yok mu?';
    String signUpText = 'Hemen kayıt ol';

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
          onTap: () => Get.to(() => const SignupPreview()),
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

  Expanded _expanded(int flex, Widget child) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }

  Column _loginButton() {
    return Column(
      children: [
        CustomElevatedButton(
          fun: () {}, // butona tiklandiginda calisacak fonksiyon
          text: _login,
        ),
      ],
    );
  }

  Column _inputfieldColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CustomTextField(
            borderColor: colorTransparent,
            fun: _setUsername, //s
            inputType: TextInputType.emailAddress,
            inputAction: TextInputAction.next,
            hintText: _usernameHint,
            prefixIcon: const Icon(Icons.person),
            isRoundedBorder: true,
            obscureText: false,
          ),
        ),
        CustomTextField(
          fun: _setPassword, // s
          borderColor: colorTransparent,
          inputType: TextInputType.visiblePassword,
          inputAction: TextInputAction.done,
          prefixIcon: const Icon(Icons.key),
          obscureText: _isPasswordObscure,
          suffix: _obscureButton(),
          hintText: _passwordHint,
          maxLines: 1,
          isRoundedBorder: true,
        ),
      ],
    );
  }

  void _setUsername(String email) => setState(() => _email = email);
  void _setPassword(String password) => setState(() => _password = password);

  IconButton _obscureButton() {
    return IconButton(
      onPressed: () => setState(
        () => _isPasswordObscure = !_isPasswordObscure,
      ),
      icon: _isPasswordObscure ? iconVisibltyOn : iconVisibilityOff,
    );
  }
}
