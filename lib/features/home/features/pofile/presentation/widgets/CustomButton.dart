import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      required this.icon,
      this.color,
      this.fontSize,
      this.colorIcon,
      this.sizeIcon});

  Function()? onPressed;
  String text;
  double? sizeIcon;
  Color? colorIcon;
  IconData? icon;
  double? fontSize;

  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 46.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [AppColors.defaultBoxShadow],
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Container(
              height: 40.h,
              width: 40.w,
              decoration: const BoxDecoration(
                color: Color(0xfff4f8f9),
                borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
              ),
              child: Icon(
                icon,
                color: const Color.fromRGBO(25, 123, 141, 1),
              )),
          SizedBox(
            width: 20.w,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff004854),
              fontFamily: 'Montserrat semibold',
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
                size: 12,
              )),
        ],
      ),
    );
  }
}
