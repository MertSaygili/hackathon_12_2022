import 'package:flutter/material.dart';
import 'colors.dart';

class InputBorders {
  final InputBorder textFieldOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: colorGrey, width: 2),
  );

  final InputBorder textFieldUnderlineBorder = const UnderlineInputBorder();

  final RoundedRectangleBorder elevatedButtonBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );
}
