// import 'package:flutter/material.dart';

// import '../../constants/app/borders.dart';

// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     required this.fun,
//     required this.inputType,
//     required this.inputAction,
//     required this.isRoundedBorder,
//     required this.obscureText,
//     this.label,
//     this.hintText,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.maxLength,
//     this.maxLines,
//     this.suffix,
//     this.borderColor,
//     this.enabled,
//     this.contentPadding,
//     this.isFilled,
//   });

//   final Function fun;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final Widget? label;
//   final String? hintText;
//   final Widget? suffix;
//   final Icon? suffixIcon;
//   final Icon? prefixIcon;
//   final bool obscureText;
//   final int? maxLength;
//   final int? maxLines;
//   final Color? borderColor;
//   final bool isRoundedBorder;
//   final bool? enabled;
//   final EdgeInsets? contentPadding;
//   final bool? isFilled;

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   late final InputBorder _border;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.isRoundedBorder) {
//       _border = InputBorders().textFieldOutlineBorder.copyWith(
//             borderSide: BorderSide(
//               // color: widget.borderColor ?? primaryColor,
//               width: 2,
//             ),
//           );
//     } else {
//       _border = InputBorders().textFieldUnderlineBorder;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: (value) => widget.fun(value),
//       keyboardAppearance: Brightness.dark,
//       keyboardType: widget.inputType,
//       textInputAction: widget.inputAction,
//       obscureText: widget.obscureText,
//       maxLength: widget.maxLength,
//       maxLines: widget.maxLines,
//       cursorColor: primaryColor,
//       decoration: InputDecoration(
//         // TODO BU BEYAZ RENK TEMAYA GÖRE DEĞİŞECEK
//         // fillColor: colorWhite,
//         filled: widget.isFilled ?? true,
//         contentPadding: widget.contentPadding,
//         isDense: true,
//         label: widget.label,
//         hintText: widget.hintText,
//         prefixIcon: widget.prefixIcon,
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: primaryColor, width: 2),
//         ),
//         // suffix: widget.suffix,
//         suffixIcon: widget.suffix,
//         border: _border,
//         enabledBorder: _border,
//         disabledBorder: _border,
//         enabled: widget.enabled ?? true,
//       ),
//     );
//   }
// }
