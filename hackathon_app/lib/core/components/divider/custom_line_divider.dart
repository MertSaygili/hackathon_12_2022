import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomLineDivider extends StatelessWidget {
  final Color? textColor;
  final Color? lineColor;
  final double _dividerThickness = 1;
  final String _or = 'or';

  const CustomLineDivider({super.key, this.textColor, this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _divider(context, true),
      ],
    );
  }

  Container _divider(BuildContext context, bool check) {
    return Container(
      margin: check
          ? const EdgeInsets.only(right: 20, top: 0, bottom: 20)
          : const EdgeInsets.only(left: 20, top: 0, bottom: 20),
      color: lineColor ?? colorGrey,
      height: _dividerThickness,
      width: MediaQuery.of(context).size.width / 1.2,
    );
  }
}
