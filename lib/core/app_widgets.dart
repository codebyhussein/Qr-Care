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

  static Widget defultText({required String text}) => Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat semibold',
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            height: 1),
      );
}
