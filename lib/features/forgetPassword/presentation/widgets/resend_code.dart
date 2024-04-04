 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';

class ResendCodeWidget extends StatelessWidget {
  ResendCodeWidget({super.key, required this.onPressed});
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
               getTranslated("ResendCode", context)!,
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontFamily: 'Montserrat meduim',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1),
              ),
              SizedBox(
                width: 80.w,
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
