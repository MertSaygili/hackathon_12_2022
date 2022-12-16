import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/components/textfield/custom_textfield.dart';

import '../../core/constants/app/strings.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: CustomAppBar(
          leading: Image.asset(logoUrlSmall),
          actions: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: CustomTextField(
              fun: () {},
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
              isRoundedBorder: true,
              obscureText: false,
              suffixIcon: const Icon(Icons.search),
            ),
          ),
          backButton: false,
          preferedSize: 75,
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
