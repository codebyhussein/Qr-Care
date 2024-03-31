import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_care/features/home/widgets/CustomText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), side: BorderSide.none),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(style: BorderStyle.none)),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "Log out?",
              alignment: Alignment.center,
              color: Colors.white,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: "Are you sure want to log out?",
              alignment: Alignment.center,
              color: Colors.white,
              fontSize: 10.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                DefultButtonLayoutScreen(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Cancel",
                    colorButton: Colors.white,
                    colorText: AppColors.mainColor,
                    fontSize: 12.sp),
                DefultButtonLayoutScreen(
                    onPressed: () async {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    text: "Log Out",
                    colorButton: Colors.red,
                    colorText: Colors.white,
                    fontSize: 12.sp),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
