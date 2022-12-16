import 'package:flutter/material.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.fun,
    required this.text,
  });

  final Function fun;
  final String text;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  final double _height = 25;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          foregroundColor: colorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => widget.fun(),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: colorWhite,
              ),
        ),
      ),
    );
  }
}
