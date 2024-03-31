import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

class CustomImage extends StatefulWidget {
  CustomImage(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.color,
      required this.isMale});

  String text;
  String imageUrl;
  Color color;
  bool isMale;
  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: widget.isMale ? AppColors.mainColor : Colors.transparent,
              width: 2)),
      child: Column(
        children: [
          SizedBox(
              width: 113.w,
              height: 150.h,
              child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Image.asset(
                    widget.imageUrl,
                  ))),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 25.h,
              width: 105.w,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                  child: Text(
                widget.text,
                style: TextStyle(
                    fontFamily: 'Montserrat semibold',
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              )))
        ],
      ),
    );
  }
}
