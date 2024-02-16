import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

class DefultButton extends StatelessWidget {
  DefultButton({super.key, required this.onPressed, required this.text});
  VoidCallback onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.w,
        height: 38.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.mainColor),
        child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat meduim',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            )));
  }
}
