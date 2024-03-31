import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
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
              title: "Help & Support",
            ),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: AppWidgets.title(
                  sizeBox: 90.h,
                  textAlign: TextAlign.left,
                  text:
                      "We are here to assist you with\n anything and everything in\n QR Care",
                  fontSize: 17.sp),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: AppWidgets.description(
                  textAlign: TextAlign.start,
                  text:
                      "QR Care collaborates with governmental\n institutions to gather and manage its data.\n With regular updates and secure handling, the\n app improves its interaction with service\n providers, ensuring a comprehensive user\n experience.",
                  fontSize: 14.sp,
                  colorText: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AppWidgets.title(
                  textAlign: TextAlign.start,
                  text: "Frequently Asked Questions (FAQs)"),
            ),
            Faqs(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                isVisible: isVisible,
                content:
                    "You can create an account by following\n the simple steps when opening\n the app for the first time.",
                title: "How do I create a QR Care account?"),
            Faqs(
                onPressed: () {
                  setState(() {
                    isVisible1 = !isVisible1;
                  });
                },
                isVisible: isVisible1,
                content:
                    "How secure is my data with QR Care? Rest assured, we prioritize the security and confidentiality of your health information. Learn more in our Privacy Policy.",
                title: "How can I update my personal information?"),
            Faqs(
                onPressed: () {
                  setState(() {
                    isVisible2 = !isVisible2;
                  });
                },
                isVisible: isVisible2,
                content:
                    "Rest assured, we prioritize the security and confidentiality of your health information. Learn more in our Privacy Policy.",
                title: "How secure is my data with QR Care?"),
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: AppWidgets.title(
                  sizeBox: 30.h,
                  textAlign: TextAlign.start,
                  text: "Contact Us"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: AppWidgets.description(
                  textAlign: TextAlign.start,
                  text:
                      "For personalized support and any inquiries you may have, feel free to reach out to us:",
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
                    text: "Email:",
                    fontSize: 12.sp,
                    sizeBox: 18),
                AppWidgets.description(
                    textAlign: TextAlign.start,
                    text: "support@QR Care.com",
                    fontSize: 12.sp,
                    colorText: Colors.grey),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 12.h),
              child: AppWidgets.title(
                  textAlign: TextAlign.start,
                  text: "Report an Issue",
                  fontSize: 12.sp,
                  sizeBox: 18),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 10.w),
              child: AppWidgets.description(
                  textAlign: TextAlign.start,
                  text:
                      "Encountered a problem or have a suggestion? Let us know through our Issue Report Form.",
                  fontSize: 12.sp,
                  colorText: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 12.h),
              child: AppWidgets.title(
                  textAlign: TextAlign.start,
                  text: "Latest Updates",
                  fontSize: 12.sp,
                  sizeBox: 18),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 10.w),
              child: AppWidgets.description(
                  textAlign: TextAlign.start,
                  text:
                      "Stay informed about the latest features and improvements on QR Care by checking our Update page",
                  fontSize: 10.sp,
                  colorText: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
