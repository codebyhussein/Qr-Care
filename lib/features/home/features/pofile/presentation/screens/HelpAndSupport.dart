import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/FAQs.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            CustomAppBar(
              title: getTranslated("helpSupport", context)!,
            ),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: AppWidgets.title(
                  sizeBox: 90.h,
                  textAlign: TextAlign.start,
                  text: getTranslated("helpOne", context)!,
                  fontSize: 17.sp),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: AppWidgets.description(
                  alignmentDirectional: AlignmentDirectional.topStart,
                  textAlign: TextAlign.start,
                  text: getTranslated("helpTwo", context)!,
                  fontSize: 14.sp,
                  colorText: Colors.grey),
            ),
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 10),
              child: AppWidgets.title(
                  textAlign: TextAlign.start,
                  text: getTranslated("helpThree", context)!),
            ),
            Faqs(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                isVisible: isVisible,
                content: getTranslated("helpFour", context)!,
                title: getTranslated("helpFive", context)!),
            Faqs(
                onPressed: () {
                  setState(() {
                    isVisible1 = !isVisible1;
                  });
                },
                isVisible: isVisible1,
                content: getTranslated("helpSix", context)!,
                title: getTranslated("helpSeven", context)!),
            Faqs(
                onPressed: () {
                  setState(() {
                    isVisible2 = !isVisible2;
                  });
                },
                isVisible: isVisible2,
                content: getTranslated("helpEight", context)!,
                title: getTranslated("helpNine", context)!),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.0.w),
              child: AppWidgets.title(
                  sizeBox: 30.h,
                  textAlign: TextAlign.start,
                  text: getTranslated("contactUs", context)!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: AppWidgets.description(
                  alignmentDirectional: AlignmentDirectional.topStart,
                  textAlign: TextAlign.start,
                  text: getTranslated("helpTen", context)!,
                  fontSize: 12.sp,
                  colorText: Colors.grey),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                AppWidgets.title(
                    textAlign: TextAlign.start,
                    text: getTranslated("email", context)!,
                    fontSize: 12.sp,
                    sizeBox: 18),
                AppWidgets.description(
                    alignmentDirectional: AlignmentDirectional.topStart,
                    textAlign: TextAlign.start,
                    text: " support@QR Care.com",
                    fontSize: 12.sp,
                    colorText: Colors.grey),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, top: 12.h),
              child: AppWidgets.title(
                  textAlign: TextAlign.start,
                  text: getTranslated("helpEleven", context)!,
                  fontSize: 12.sp,
                  sizeBox: 18),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 5.h, start: 10.w),
              child: AppWidgets.description(
                  alignmentDirectional: AlignmentDirectional.topStart,
                  textAlign: TextAlign.start,
                  text: getTranslated("helpTwelve", context)!,
                  fontSize: 12.sp,
                  colorText: Colors.grey),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, top: 12.h),
              child: AppWidgets.title(
                  textAlign: TextAlign.start,
                  text: getTranslated("helpThirteen", context)!,
                  fontSize: 12.sp,
                  sizeBox: 18),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 5.h, start: 10.w),
              child: AppWidgets.description(
                  textAlign: TextAlign.start,
                  alignmentDirectional: AlignmentDirectional.topStart,
                  text:
                  getTranslated("helpFourteen", context)!        ,          fontSize: 10.sp,
                  colorText: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
