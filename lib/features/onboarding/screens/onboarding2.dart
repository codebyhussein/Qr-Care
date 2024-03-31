import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_widgets.dart';

class onboarding2 extends StatelessWidget {
  const onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/onborading2.png',
          height: 316.h,
          width: 320.w,
        ),
        SizedBox(
          height: 60.h,
        ),
        AppWidgets.defultdesrption(
          text:
              'Make sure your personal information\nis accurate and up-to-date. And if you\ntake care of your children',
        )
      ],
    );
  }
}
