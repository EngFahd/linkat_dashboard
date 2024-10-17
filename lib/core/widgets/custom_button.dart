import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonForm extends StatelessWidget {
  const CustomButtonForm(
      {super.key,
      this.onPressed,
      required this.text,
      this.style,
      this.background, this.width});
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? style;
  final Color? background;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ?? double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          backgroundColor: background ?? Colors.black,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
