import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.fun,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
  });

  final Function fun;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? child;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  final double _height = 45;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: MediaQuery.of(context).size.width / 1.25,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor ?? colorPrimary,
          foregroundColor: widget.foregroundColor ?? colorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => widget.fun(),
        child: widget.child ??
            Text(
              widget.text,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: widget.foregroundColor ?? colorWhite,
                  ),
            ),
      ),
    );
  }
}
