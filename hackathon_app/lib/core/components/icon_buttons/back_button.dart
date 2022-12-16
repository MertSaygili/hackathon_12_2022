import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/icons.dart';

class CustomIconButtons {
  Align backButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: iconBackButton,
      ),
    );
  }
}
