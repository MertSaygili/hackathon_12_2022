import 'package:flutter/material.dart';
import 'package:hackathon_app/core/components/appbar/custom_appbar.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/app/strings.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: colorScaffold,
        preferedSize: 55,
        backButton: true,
        actions: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(logoUrlSmall, height: 50),
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
