import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/base/controllers/app_controller.dart';
import 'package:hackathon_app/core/components/elevatedButton/custom_elevatedbutton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppController controller = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        fun: () {
          controller.signOut();
        },
        text: "Sign Out");
  }
}
