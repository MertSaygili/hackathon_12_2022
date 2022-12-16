import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';
import 'package:hackathon_app/core/components/form/auth_form.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';
import 'package:hackathon_app/view/preview/signup.dart';

import '../../core/constants/app/colors.dart';
import '../../core/components/divider/custom_divider.dart';

class LoginPreview extends StatefulWidget {
  const LoginPreview({super.key});

  @override
  State<LoginPreview> createState() => _LoginPreviewState();
}

class _LoginPreviewState extends State<LoginPreview> {
  final int _flex = 1;
  final String _login = 'Log in';

  final formKey = GlobalKey<FormState>();
  final emailFieldKey = GlobalKey<FormFieldState<String>>();
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
            _expanded(
                _flex * 3,
                Column(
                  children: [
                    AuthForm(
                      formKey: formKey,
                      emailFieldKey: emailFieldKey,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            if (emailFieldKey.currentState!.validate()) {
                              controller.forgotPass();
                            }
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                                fontSize: 11.0),
                          )),
                    ),
                  ],
                )),
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
              controller.loginUser();
            }
          }, // butona tiklandiginda calisacak fonksiyon
          text: _login,
        ),
      ],
    );
  }
}
