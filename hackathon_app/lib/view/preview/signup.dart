import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';

class SignupPreview extends StatefulWidget {
  const SignupPreview({super.key});

  @override
  State<SignupPreview> createState() => _SignupPreviewState();
}

class _SignupPreviewState extends State<SignupPreview> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(preferedSize: 50, backButton: true),
    );
  }
}
