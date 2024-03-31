import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_widgets.dart';

class ParentBuilder extends StatelessWidget {
  ParentBuilder(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.isparent,
      required this.onPressed});

  String title;
  String description;
  String image;
  bool isparent;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 170.h,
        width: 300.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: isparent ? AppColors.mainColor : Colors.transparent,
                width: 2),
            boxShadow: const [AppColors.defaultBoxShadow]),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.defultText(text: title),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 72, 84, 1),
                      fontFamily: 'Montserrat meduim',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: SizedBox(child: Image.asset(image)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
