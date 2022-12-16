import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/stack_image/stack_image.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class SignupPreview extends StatefulWidget {
  const SignupPreview({super.key});

  @override
  State<SignupPreview> createState() => _SignupPreviewState();
}

class _SignupPreviewState extends State<SignupPreview> {
  final String _bottomImagePath = 'assets/images/png/reg-1.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        backgroundColor: colorScaffold,
        preferedSize: 50,
        backButton: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.75,
            decoration: const BoxDecoration(
              color: colorScaffold,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
          StackImage().bottomImage(context, _bottomImagePath),
        ],
      ),
    );
  }
}
