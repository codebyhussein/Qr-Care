import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      this.fontWeight,
      this.fontSize,
      required this.text,
        required this.alignment,
      this.color});

  String text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  AlignmentDirectional alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:alignment ,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontFamily: 'Montserrat semibold',
            fontSize: fontSize),
      ),
    );
  }
}
