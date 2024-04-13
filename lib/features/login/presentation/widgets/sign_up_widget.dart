import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';

class SignupWidget extends StatelessWidget {
  SignupWidget({super.key, required this.onPressed});
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getTranslated("Donthaveanaccount", context)!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat meduim',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            getTranslated("SignUp", context)!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat meduim',
              fontSize: 12.sp,
              color: const Color(0xffF84D5C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
