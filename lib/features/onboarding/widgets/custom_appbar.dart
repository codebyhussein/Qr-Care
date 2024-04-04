import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';

class CustomAppBarAppOnboardingScreen extends StatelessWidget {
  CustomAppBarAppOnboardingScreen(
      {super.key,
      required this.controller,
      required this.isLastPage,
      required this.isFirstPage});
  final controller;
  bool isLastPage;
  bool isFirstPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              controller.previousPage(
                  duration: const Duration(seconds: 1), curve: Curves.linear);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: isFirstPage ? Colors.transparent : AppColors.mainColor,
            )),
        isLastPage
            ? const Text('')
            : TextButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                child: Text(
                  getTranslated("Skip", context)!,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                )),
      ],
    );
  }
}
