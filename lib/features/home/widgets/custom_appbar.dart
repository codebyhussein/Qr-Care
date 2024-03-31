import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';

class CustomAppBarLayoutScreen extends StatelessWidget {
  CustomAppBarLayoutScreen({
    super.key,
    required this.title,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color.fromRGBO(0, 72, 84, 1),
          fontFamily: 'Montserrat semibold',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.notificationRoute);
            },
            icon: Icon(
              Icons.notifications,
              size: 24.h,
              color: AppColors.mainColor,
            )),
      ],
    );
  }
}
