import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_widgets.dart';

class AddChildWidget extends StatelessWidget {
  const AddChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97.h,
      width: 118.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.h),
            Container(
                height: 43.h,
                width: 43.w,
                decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(14)),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.addChildRoute);
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColors.mainColor,
                    ))),
            SizedBox(height: 6.h),
            AppWidgets.defultText(text: 'Add a child'),
          ],
        ),
      ),
    );
  }
}
