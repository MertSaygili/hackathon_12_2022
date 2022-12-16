import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';

class LoginPreview extends StatefulWidget {
  const LoginPreview({super.key});

  @override
  State<LoginPreview> createState() => _LoginPreviewState();
}

class _LoginPreviewState extends State<LoginPreview> {
  final int _flex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(preferedSize: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _expanded(
              _flex,
              Image.asset(logoUrl),
            ),
            _expanded(_flex * 3, _inputfieldColumn())
          ],
        ),
      ),
    );
  }

  Expanded _expanded(int flex, Widget child) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }

  Column _inputfieldColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: TextFormField(),
        ),
        TextFormField(),
      ],
    );
  }
}
