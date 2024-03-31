import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.mainColor,
          )),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat semibold',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            height: 1.1),
      ),
      centerTitle: true,
    );
  }
}
