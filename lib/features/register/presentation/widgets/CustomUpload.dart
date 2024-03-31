import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

import 'package:qr_care/core/app_color.dart';

class CustomUpload extends StatelessWidget {
  const CustomUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final ImagePicker picker = ImagePicker();

        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
      },
      icon: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Container(
          height: 24.h,
          width: 119.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: const [AppColors.defaultBoxShadow]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 20.w),
              const Text(
                'Upload ID',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(158, 158, 158, 0.800000011920929),
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    letterSpacing: -0.3333333432674408,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(width: 20.w),
              Container(
                height: 24.h,
                width: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.mainColor,
                ),
                child: const Icon(
                  IconlyLight.upload,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
