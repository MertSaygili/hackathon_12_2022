import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: color ?? colorWhite),
    );
  }
}
