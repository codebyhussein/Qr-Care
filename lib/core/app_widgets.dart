import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidgets {
  static Widget defultdesrption({required String text}) => SizedBox(
        height: 70.h,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: const Color.fromARGB(255, 83, 83, 83),
              fontSize: 16.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
      );

  static Widget defultText({required String text, TextAlign? textAlign}) =>
      Text(
        text,
        textAlign: textAlign ?? TextAlign.left,
        style: TextStyle(
            color: const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat semibold',
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            height: 1),
      );

  static Widget titleDialog({
    required String text,
  }) =>
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat meduim',
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      );

  static Widget descriptionDialog({
    required String text,
  }) =>
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat meduim',
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
      );

  static Widget defultdesrptionRegister({required String text}) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: const Color(0xff004854),
            fontSize: 12.sp,
            fontFamily: 'Montserrat meduim',
            fontWeight: FontWeight.w400),
      );

  static Widget defultTextRegister({
    required String text,
  }) =>
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: const Color(0xff004854),
            fontFamily: 'Montserrat semibold',
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            height: 1),
      );

  static Widget title({
    required TextAlign textAlign,
    required String text,
    double? fontSize,
    double? sizeBox,
  }) =>
      SizedBox(
        height: sizeBox ?? 50.h,
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            color: const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat semibold',
            fontSize: fontSize ?? 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static Widget description(
          {required TextAlign textAlign,
          required String text,
          required double fontSize,
            required AlignmentDirectional alignmentDirectional,
          Color? colorText}) =>
      Align(
        alignment: alignmentDirectional,
        child: Text(
          text,

          textAlign: textAlign,

          style: TextStyle(
            color: colorText ?? const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat meduim',
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
