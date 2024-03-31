import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

import '../../../../widgets/CustomText.dart';

Widget titleWidget({required String text}) => Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w),
      child: CustomText(
        alignment: Alignment.topLeft,
        text: text,
        color: AppColors.mainColor,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
    );
