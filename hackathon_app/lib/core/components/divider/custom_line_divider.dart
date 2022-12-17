import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomLineDivider extends StatelessWidget {
  final Color? textColor;
  final Color? lineColor;
  final double _dividerThickness = 0.5;

  const CustomLineDivider({super.key, this.textColor, this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _divider(context),
      ],
    );
  }

  Container _divider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 20),
      color: lineColor ?? colorGrey,
      height: _dividerThickness,
      width: MediaQuery.of(context).size.width / 1.1,
    );
  }
}
