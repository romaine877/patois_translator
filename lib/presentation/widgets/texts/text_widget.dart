import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.string, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.bold = false,
  }) : super(key: key);
  final String string;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          color: color ?? Colors.white,
          fontWeight:
              bold == false ? fontWeight ?? FontWeight.w400 : FontWeight.bold),
    );
  }
}
