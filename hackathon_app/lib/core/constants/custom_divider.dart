import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomTextDivider extends StatelessWidget {
  final Color? textColor;
  final Color? lineColor;
  final double _dividerThickness = 2;
  final String _or = 'veya';

  const CustomTextDivider({super.key, this.textColor, this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _divider(context, true),
        Text(
          _or,
          style: TextStyle(
            color: textColor ?? colorGrey,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        _divider(context, false),
      ],
    );
  }

  Container _divider(BuildContext context, bool check) {
    return Container(
      margin: check
          ? const EdgeInsets.only(right: 20, top: 30, bottom: 30)
          : const EdgeInsets.only(left: 20, top: 30, bottom: 30),
      color: lineColor ?? colorGrey,
      height: _dividerThickness,
      width: MediaQuery.of(context).size.width / 3.1,
    );
  }
}
