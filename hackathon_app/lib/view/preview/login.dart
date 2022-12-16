import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/constants/app/icons.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';
import 'package:hackathon_app/view/preview/signup.dart';

import '../../core/components/textfield/custom_textfield.dart';
import '../../core/constants/app/colors.dart';
import '../../core/constants/app/regex.dart';
import '../../core/components/divider/custom_divider.dart';

class LoginPreview extends StatefulWidget {
  const LoginPreview({super.key});

  @override
  State<LoginPreview> createState() => _LoginPreviewState();
}

class _LoginPreviewState extends State<LoginPreview> {
  final int _flex = 1;
  final String _login = 'Log in';
  final String _emailHint = 'Email';
  final String _passwordHint = 'Password';
  bool _isPasswordObscure = true;

  String _email = '';
  String _password = '';

  final formKey = GlobalKey<FormState>();
  AppController controller = Get.find<AppController>();

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
    String anotherAccountText = "You haven't got account yet?";
    String signUpText = 'Register now!';

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
          fun: () {
            if (formKey.currentState!.validate() &&
                !controller.isLoginPressed) {
              // controller.loginUser(_email, _password);
            }
          }, // butona tiklandiginda calisacak fonksiyon
          text: _login,
        ),
      ],
    );
  }

  Form _inputfieldColumn() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextField(
              borderColor: colorTransparent,
              fun: _setEmail, //s
              validator: (String value) {
                if (value.isEmpty) {
                  return "Please enter your email adress!";
                } else if (!emailRegex.hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              hintText: _emailHint,
              prefixIcon: iconEmail,
              isRoundedBorder: true,
              obscureText: false,
            ),
          ),
          CustomTextField(
            fun: _setPassword, // s
            validator: (String value) {
              if (value.isEmpty) {
                return "Please enter your password!";
              }
              return null;
            },
            borderColor: colorTransparent,
            inputType: TextInputType.visiblePassword,
            inputAction: TextInputAction.done,
            prefixIcon: iconKey,
            obscureText: _isPasswordObscure,
            suffix: _obscureButton(),
            hintText: _passwordHint,
            maxLines: 1,
            isRoundedBorder: true,
          ),
        ],
      ),
    );
  }

  void _setEmail(String email) => setState(() => _email = email);
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
