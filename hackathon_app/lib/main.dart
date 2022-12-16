import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/view/preview/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Barter Buddy',
      theme: ThemeData(primaryColor: colorScaffold),
      home: const OnboardPreview(),
    );
  }
}
