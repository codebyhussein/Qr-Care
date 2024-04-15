import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomAppBar(
            title: getTranslated("AboutApp", context)!,
          )
        ],
      ),
    );
  }
}
