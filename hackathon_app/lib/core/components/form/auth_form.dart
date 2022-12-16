import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';

import '../../constants/app/colors.dart';
import '../../constants/app/icons.dart';
import '../../constants/app/regex.dart';
import '../textfield/custom_textfield.dart';

class AuthForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const AuthForm({super.key, required this.formKey});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isPasswordObscure = true;
  AppController controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    const String emailHint = 'Email';
    const String passwordHint = 'Password';

    return Form(
      key: widget.formKey,
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
              hintText: emailHint,
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
            obscureText: isPasswordObscure,
            suffix: _obscureButton(),
            hintText: passwordHint,
            maxLines: 1,
            isRoundedBorder: true,
          ),
        ],
      ),
    );
  }

  void _setEmail(String email) => controller.email = email;

  void _setPassword(String password) => controller.password = password;

  IconButton _obscureButton() {
    return IconButton(
      onPressed: () => setState(
        () => isPasswordObscure = !isPasswordObscure,
      ),
      icon: isPasswordObscure ? iconVisibltyOn : iconVisibilityOff,
    );
  }
}
