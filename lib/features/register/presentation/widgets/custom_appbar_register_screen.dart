import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/assets/assets_manager.dart';

class CustomAppBarRegister extends StatelessWidget {
  const CustomAppBarRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 61.h,
        ),
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.mainColor,
                )),
            Center(
                child: SvgPicture.asset(
              AppAssets.logo_Path_register,
              width: 112.w,
              height: 112.h,
            ))
          ],
        )
      ],
    );
  }
}
