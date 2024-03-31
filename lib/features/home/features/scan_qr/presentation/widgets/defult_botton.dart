import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

class DefultButtonLayoutScreen extends StatelessWidget {
  DefultButtonLayoutScreen(
      {super.key,
      required this.onPressed,
      this.fontSize,
      required this.text,
      this.colorButton,
      this.colorText});
  VoidCallback onPressed;
  Color? colorButton;
  Color? colorText;
  double? fontSize;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: 90.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [AppColors.defaultBoxShadow],
          color: colorButton ?? AppColors.mainColor),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: colorText ?? const Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Montserrat semibold',
              fontSize: fontSize ?? 14.sp,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
      ),
    );
  }
}
