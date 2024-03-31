import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/CustomButton.dart';
import 'package:qr_care/features/home/widgets/CustomText.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

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
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(IconlyLight.close_square))),
            CustomText(
              text: "Account setting",
              alignment: Alignment.center,
              color: Colors.white,
              fontSize: 15.sp,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              text: "Change password",
              icon: IconlyLight.lock,
              onPressed: () {
                Navigator.pushNamed(context, Routes.changePasswordRoute);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              text: "Language",
              icon: Icons.language_rounded,
              onPressed: () {},
            ),
            SizedBox(
              height: 65.h,
            ),
          ],
        ),
      ),
    );
  }
}
