import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackImage {
  Align bottomImage(BuildContext context, String imagePath) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SvgPicture.asset(
        imagePath,
        height: MediaQuery.of(context).size.height / 2.5,
        // width: MediaQuery.of(context).size.width * 1.5,
        fit: BoxFit.cover,
      ),
    );
  }
}
