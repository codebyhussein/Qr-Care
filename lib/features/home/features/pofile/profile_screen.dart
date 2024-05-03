import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/content.dart';
import 'package:qr_care/features/home/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomAppBarLayoutScreen(
            title: getTranslated("Profile", context)!,
          ),
          SizedBox(
            height: 42.h,
          ),
          ContentProfile(),
        ],
      ),
    );
  }
}
